
var/jsonpath = "/home/bay12/public_html"
var/dmepath = "/home/bay12/git/baystation12.dme"
var/makejson = 1 //temp
/proc/makejson()

	if(!makejson)
		return
	fdel("[jsonpath]/info.json")
		//to_chat(usr, "Error cant delete json")
	//else
		//to_chat(usr, "Deleted json in public html")
	fdel("info.json")
		//to_chat(usr, "error cant delete local json")
	//else
		//to_chat(usr, "Deleted local json")
	var/F = file("info.json")
	if(!isfile(F))
		return
	var/mode
	if(ticker)
		if(ticker.current_state == 1)
			/* Bastion of Endeavor Translation
			mode = "Round Setup"
			*/
			mode = "Инициализация раунда"
			// End of Bastion of Endeavor Translation
		else if(ticker.hide_mode)
			/* Bastion of Endeavor Translation
			mode = "SECRET"
			*/
			mode = "Секретный режим"
			// End of Bastion of Endeavor Translation
		else
			mode = master_mode
	var/playerscount = 0
	var/players = ""
	/* Bastion of Endeavor Translation
	var/admins = "no"
	*/
	var/admins = "нет"
	// End of Bastion of Endeavor Translation
	for(var/client/C)
		playerscount++
		if(C.holder && C.holder.level >= 0)		// make sure retired admins don't make nt think admins are on
			if(!C.stealth)
				/* Bastion of Endeavor Translation
				admins = "yes"
				*/
				admins = "да"
				// End of Bastion of Endeavor Translation
				players += "[C.key];"
			else
				players += "[C.fakekey];"
		else
			players += "[C.key];"
	to_chat(F, "{\"mode\":\"[mode]\",\"players\" : \"[players]\",\"playercount\" : \"[playerscount]\",\"admin\" : \"[admins]\",\"time\" : \"[time2text(world.realtime,"MM/DD - hh:mm")]\"}")
	fcopy("info.json","[jsonpath]/info.json")

/proc/switchmap(newmap,newpath)
	var/oldmap
	var/obj/mapinfo/M = locate()

	if(M)
		oldmap = M.mapname

	else
		/* Bastion of Endeavor Translation
		message_admins("Did not locate mapinfo object. Go bug the mapper to add a /obj/mapinfo to their map!\n For now, you can probably spawn one manually. If you do, be sure to set it's mapname var correctly, or else you'll just get an error again.")
		*/
		message_admins("Не найден объект mapinfo. Попросите маппера добавить /obj/mapinfo в свою карту!\n Пока что вы можете заспавнить объект самостоятельно, но не допускайте ошибок в mapname.")
		// End of Bastion of Endeavor Translation
		return

	/* Bastion of Endeavor Translation
	message_admins("Current map: [oldmap]")
	*/
	message_admins("Текущая карта: [oldmap]")
	// End of Bastion of Endeavor Translation
	var/text = file2text(dmepath)
	var/path = "#include \"maps/[oldmap].dmm\""
	var/xpath = "#include \"maps/[newpath].dmm\""
	var/loc = findtext(text,path,1,0)
	if(!loc)
		path = "#include \"maps\\[oldmap].dmm\""
		xpath = "#include \"maps\\[newpath].dmm\""
		loc = findtext(text,path,1,0)
		if(!loc)
			/* Bastion of Endeavor Translation
			message_admins("Could not find '#include \"maps\\[oldmap].dmm\"' or '\"maps/[oldmap].dmm\"' in the bs12.dme. The mapinfo probably has an incorrect mapname var. Alternatively, could not find the .dme itself, at [dmepath].")
			*/
			message_admins("Не удалось найти '#include \"maps\\[oldmap].dmm\"' или '\"maps/[oldmap].dmm\"' в bs12.dme. В mapinfo, вероятно, ошибка в mapname, либо не удалось найти сам .dme по адресу [dmepath].")
			// End of Bastion of Endeavor Translation
			return

	var/rest = copytext(text, loc + length(path))
	text = copytext(text,1,loc)
	text += "\n[xpath]"
	text += rest
/*	for(var/A in lines)
		if(findtext(A,path,1,0))
			lineloc = lines.Find(A,1,0)
			lines[lineloc] = xpath
			to_world("FOUND")*/
	fdel(dmepath)
	var/file = file(dmepath)
	file << text
	/* Bastion of Endeavor Translation
	message_admins("Compiling...")
	*/
	message_admins("Производится компиляция...")
	// End of Bastion of Endeavor Translation
	shell("./recompile")
	/* Bastion of Endeavor Translation
	message_admins("Done")
	world.Reboot("Switching to [newmap]")
	*/
	message_admins("Компиляция завершена.")
	world.Reboot("Смена карты на [newmap]")
	// End of Bastion of Endeavor Translation

/obj/mapinfo
	invisibility = 101
	var/mapname = "thismap"
	var/decks = 4
/proc/GetMapInfo()
//	var/obj/mapinfo/M = locate()
//	Just removing these to try and fix the occasional JSON -> WORLD issue.
//	to_world(M.name)
//	to_world(M.mapname)
/client/proc/ChangeMap(var/X as text)
	/* Bastion of Endeavor Translation
	set name = "Change Map"
	set category  = "Admin"
	*/
	set name = "Сменить карту"
	set category  = "Администрация"
	// End of Bastion of Endeavor Translation
	switchmap(X,X)
/proc/send2adminirc(channel,msg)
	world << channel << " "<< msg
	shell("python nudge.py '[channel]' [msg]")