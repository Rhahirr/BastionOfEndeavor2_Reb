/proc/log_href(text)
	//WRITE_LOG(GLOB.world_href_log, "HREF: [text]")
	WRITE_LOG(href_logfile, "HREF: [text]")

/**
 * Appends a tgui-related log entry. All arguments are optional.
 */
/proc/log_tgui(user, message, context,
		datum/tgui_window/window,
		datum/src_object)
	var/entry = ""
	// Insert user info
	if(!user)
		/* Bastion of Endeavor Translation
		entry += "<nobody>"
		*/
		entry += "<никто>"
		// End of Bastion of Endeavor Translation
	else if(istype(user, /mob))
		var/mob/mob = user
		/* Bastion of Endeavor Translation
		entry += "[mob.ckey] (as [mob] at [mob.x],[mob.y],[mob.z])"
		*/
		entry += "[mob.ckey] (за [acase_ru(mob)] на [mob.x],[mob.y],[mob.z])"
		// End of Bastion of Endeavor Translation
	else if(istype(user, /client))
		var/client/client = user
		entry += "[client.ckey]"
	// Insert context
	if(context)
		/* Bastion of Endeavor Translation
		entry += " in [context]"
		*/
		entry += " в [context]"
		// End of Bastion of Endeavor Translation
	else if(window)
		/* Bastion of Endeavor Translation
		entry += " in [window.id]"
		*/
		entry += " в [window.id]"
		// End of Bastion of Endeavor Translation
	// Resolve src_object
	if(!src_object && window?.locked_by)
		src_object = window.locked_by.src_object
	// Insert src_object info
	if(src_object)
		/* Bastion of Endeavor Translation
		entry += "\nUsing: [src_object.type] [REF(src_object)]"
		*/
		entry += "\nИспользует: [src_object.type] [REF(src_object)]"
		// End of Bastion of Endeavor Translation
	// Insert message
	if(message)
		entry += "\n[message]"
	//WRITE_LOG(GLOB.tgui_log, entry)
	WRITE_LOG(diary, entry)
