// error_cooldown items will either be positive (cooldown time) or negative (silenced error)
//  If negative, starts at -1, and goes down by 1 each time that error gets skipped
GLOBAL_VAR_INIT(total_runtimes, 0)
GLOBAL_VAR_INIT(total_runtimes_skipped, 0)


// The ifdef needs to be down here, since the error viewer references total_runtimes
#ifdef DEBUG
/world/Error(var/exception/e, var/datum/e_src)
	GLOB.total_runtimes++ //CHOMPEdit just moving this here to start counting right away
	if(!istype(e)) // Something threw an unusual exception
		/* Bastion of Endeavor Translation
		log_error("\[[time_stamp()]] Uncaught exception: [e]")
		*/
		log_error("\[[time_stamp()]] непойманное исключение: [e]")
		// End of Bastion of Endeavor Translation
		return ..()
	
	//CHOMP Edit Stealing this bit from TGStation to try to record OOM issues.
	//this is snowflake because of a byond bug (ID:2306577), do not attempt to call non-builtin procs in this if
	if(copytext(e.name,1,32) == "Maximum recursion level reached")
		//log to world while intentionally triggering the byond bug.
		/* Bastion of Endeavor Translation
		log_world("runtime error: [e.name]\n[e.desc]")
		//if we got to here without silently ending, the byond bug has been fixed.
		log_world("The bug with recursion runtimes has been fixed. Please remove the snowflake check from world/Error in [__FILE__]:[__LINE__]")
		*/
		log_world("Рантайм: [e.name]\n[e.desc]")
		log_world("Баг с рантаймовыми рекурсиями был пофикшен. Необходимо удалить проверку в world/Error в [__FILE__]:[__LINE__]")
		// End of Bastion of Endeavor Translation
		return //this will never happen.
	
	else if(copytext(e.name,1,18) == "Out of resources!")
		/* Bastion of Endeavor Translation
		log_world("BYOND out of memory.")
		log_game("BYOND out of memory.")
		*/
		log_world("Нехватка памяти BYOND.")
		log_game("Нехватка памяти BYOND.")
		// End of Bastion of Endeavor Translation
		return ..()
	//CHOMP Edit end	
	
	if(!GLOB.error_last_seen) // A runtime is occurring too early in start-up initialization
		return ..()
	

	var/erroruid = "[e.file][e.line]"
	var/last_seen = GLOB.error_last_seen[erroruid]
	var/cooldown = GLOB.error_cooldown[erroruid] || 0
	if(last_seen == null) // A new error!
		GLOB.error_last_seen[erroruid] = world.time
		last_seen = world.time
	if(cooldown < 0)
		GLOB.error_cooldown[erroruid]-- // Used to keep track of skip count for this error
		GLOB.total_runtimes_skipped++
		return // Error is currently silenced, skip handling it

	// Handle cooldowns and silencing spammy errors
	var/silencing = 0
	// Each occurrence of a unique error adds to its "cooldown" time...
	cooldown = max(0, cooldown - (world.time - last_seen)) + ERROR_COOLDOWN
	// ... which is used to silence an error if it occurs too often, too fast
	if(cooldown > ERROR_MAX_COOLDOWN)
		cooldown = -1
		silencing = 1
		spawn(0)
			usr = null
			sleep(ERROR_SILENCE_TIME)
			var/skipcount = abs(GLOB.error_cooldown[erroruid]) - 1
			GLOB.error_cooldown[erroruid] = 0
			if(skipcount > 0)
				/* Bastion of Endeavor Translation
				log_error("\[[time_stamp()]] Skipped [skipcount] runtimes in [e.file],[e.line].")
				*/
				log_error("\[[time_stamp()]] [count_ru(skipcount, "Пропущен;;о;о", TRUE)] [count_ru(skipcount, "рантайм;;а;ов")] в [e.file],[e.line].")
				// End of Bastion of Endeavor Translation
				error_cache.logError(e, skipCount = skipcount)
	GLOB.error_last_seen[erroruid] = world.time
	GLOB.error_cooldown[erroruid] = cooldown

	// The detailed error info needs some tweaking to make it look nice
	var/list/srcinfo = null
	var/list/usrinfo = null
	var/locinfo
	// First, try to make better src/usr info lines
	if(istype(e_src))
		srcinfo = list("  src: [log_info_line(e_src)]")
		var/atom/atom_e_src = e_src
		if(istype(atom_e_src))
			srcinfo += "  src.loc: [log_info_line(atom_e_src.loc)]"
	if(istype(usr))
		usrinfo = list("  usr: [log_info_line(usr)]")
		locinfo = log_info_line(usr.loc)
		if(locinfo)
			usrinfo += "  usr.loc: [locinfo]"
	// The proceeding mess will almost definitely break if error messages are ever changed
	// I apologize in advance
	/* Bastion of Endeavor Unicode Edit
	var/list/splitlines = splittext(e.desc, "\n")
	*/
	var/list/splitlines = splittext_char(e.desc, "\n")
	// End of Bastion of Endeavor Unicode Edit
	var/list/desclines = list()
	if(splitlines.len > 2) // If there aren't at least three lines, there's no info
		for(var/line in splitlines)
			/* Bastion of Endeavor Unicode Edit
			if(length(line) < 3)
			*/
			if(length_char(line) < 3)
			// End of Bastion of Endeavor Unicode Edit
				continue // Blank line, skip it
			/* Bastion of Endeavor Unicode Edit
			if(findtext(line, "source file:"))
			*/
			if(findtext_char(line, "файл:"))
			// End of Bastion of Endeavor Unicode Edit
				continue // Redundant, skip it
			/* Bastion of Endeavor Unicode Edit
			if(findtext(line, "usr.loc:"))
			*/
			if(findtext_char(line, "usr.loc:"))
			// End of Bastion of Endeavor Unicode Edit
				continue // Our usr.loc is better, skip it
			/* Bastion of Endeavor Unicode Edit
			if(findtext(line, "usr:"))
			*/
			if(findtext_char(line, "usr:"))
			// End of Bastion of Endeavor Unicode Edit
				if(usrinfo)
					desclines.Add(usrinfo)
					usrinfo = null
				continue // Our usr info is better, replace it
			if(srcinfo)
				if(findtext(line, "src.loc:"))
					continue
				if(findtext(line, "src:"))
					desclines.Add(srcinfo)
					srcinfo = null
					continue
			/* Bastion of Endeavor Unicode Edit
			if(copytext(line, 1, 3) != "  ")
			*/
			if(copytext_char(line, 1, 3) != "  ")
			// End of Bastion of Endeavor Unicode Edit
				desclines += ("  " + line) // Pad any unpadded lines, so they look pretty
			else
				desclines += line
	if(srcinfo) // If these aren't null, they haven't been added yet
		desclines.Add(srcinfo)
	if(usrinfo)
		desclines.Add(usrinfo)
	if(silencing)
		/* Bastion of Endeavor Translation
		desclines += "  (This error will now be silenced for [ERROR_SILENCE_TIME / 600] minutes)"
		*/
		desclines += "  (Эта ошибка будет заглушена на [count_ru((ERROR_SILENCE_TIME / 600), "минут;у;ы;")])"
		// End of Bastion of Endeavor Translation

	// Now to actually output the error info...
	/* Bastion of Endeavor Translation
	log_error("\[[time_stamp()]] Runtime in [e.file],[e.line]: [e]")
	*/
	log_error("\[[time_stamp()]] Рантайм в [e.file],[e.line]: [e]")
	// End of Bastion of Endeavor Translation
	for(var/line in desclines)
		log_error(line)
	if(error_cache)
		error_cache.logError(e, desclines, e_src = e_src)

#endif

/proc/log_runtime(exception/e, datum/e_src, extra_info)
	if(!istype(e))
		world.Error(e, e_src)
		return

	if(extra_info)
		// Adding extra info adds two newlines, because parsing runtimes is funky
		if(islist(extra_info))
			e.desc = "  [jointext(extra_info, "\n  ")]\n\n" + e.desc
		else
			e.desc = "  [extra_info]\n\n" + e.desc

	world.Error(e, e_src)
