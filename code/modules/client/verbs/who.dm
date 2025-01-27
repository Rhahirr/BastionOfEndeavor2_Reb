/client/verb/who()
	/* Bastion of Endeavor Translation
	set name = "Who"
	set category = "OOC.Resources" //CHOMPEdit

	var/msg = "<b>Current Players:</b>\n"
	*/
	set name = "Кто онлайн"
	set category = "OOC.Информация"
	set desc = "Показать, кто сейчас подключён к серверу."
	var/msg = span_bold("Игроки онлайн:") + "\n"

	var/list/Lines = list()

	for(var/client/C in GLOB.clients)
		if(!check_rights_for(src, R_ADMIN|R_MOD))
			Lines += "\t[C.holder?.fakekey || C.key]"
			continue
		var/entry = "\t[C.key]"
		if(C.holder?.fakekey)
		/* Bastion of Endeavor Translation: Bastion of Endeavor TODO: Risky but we'll see
			entry += " " + span_italics("as [C.holder.fakekey])")
		entry += " - Playing as [C.mob.real_name]"
		*/
			entry += " " + span_italics("как [C.holder.fakekey])")
		entry += " – Играет за [acase_ru(C.mob, secondary = "real_name")]"
		// End of Bastion of Endeavor Translation
		switch(C.mob.stat)
			if(UNCONSCIOUS)
				/* Bastion of Endeavor Translation
				entry += " - [span_darkgray(span_bold("Unconscious"))]"
				*/
				entry += " - [span_darkgray(span_bold("Без сознания"))]"
				// End of Bastion of Endeavor Translation
			if(DEAD)
				if(isobserver(C.mob))
					var/mob/observer/dead/O = C.mob
				/* Bastion of Endeavor Translation
					if(O.started_as_observer)
						entry += " - [span_gray("Observing")]"
					else
						entry += " - [span_black(span_bold("DEAD"))]"
				else
					entry += " - [span_black(span_bold("DEAD"))]"
				*/
					if(O.started_as_observer)
						entry += " – [span_gray("Наблюдает")]"
					else
						entry += " – [span_black(span_bold("[verb_ru(C.mob, ";Мёртв;Мертва;Мертво;Мертвы;", index_v = "real_name")]"))]"
				else
					entry += " – [span_black(span_bold("[verb_ru(C.mob, ";Мёртв;Мертва;Мертво;Мертвы;", index_v = "real_name")]"))]"
				// End of Bastion of Endeavor Translation

		if(C.player_age != initial(C.player_age) && isnum(C.player_age)) // database is on
			var/age = C.player_age
			/* Bastion of Endeavor Translation
			switch(age)
				if(0 to 1)
					age = span_red(span_bold("[age] days old"))
				if(1 to 10)
					age = span_orange(span_bold("[age] days old"))
				else
					entry += " - [age] days old"
				*/
			entry += " - Возраст: [count_ru(age, "день;дня;дней")]"
			// End of Bastion of Endeavor Translation

		if(is_special_character(C.mob))
			/* Bastion of Endeavor Translation
			entry += " - [span_red(span_bold("Antagonist"))]"
			*/
			entry += " - [span_red(span_bold("Антагонист"))]"
			// End of Bastion of Endeavor Translation

		if(C.is_afk())
			var/seconds = C.last_activity_seconds()
			/* Bastion of Endeavor Translation
			entry += " (AFK - [round(seconds / 60)] minutes, [seconds % 60] seconds)"
			*/
			entry += " (АФК - [count_ru(round(seconds / 60), "минут;у;ы;")], [count_ru(round(seconds % 60), "секунд;у;ы;")])"
			// End of Bastion of Endeavor Translation

		entry += " [ADMIN_QUE(C.mob)]"
		Lines += entry

	for(var/line in sortList(Lines))
		msg += "[line]\n"

	/* Bastion of Endeavor Translation
	msg += span_bold("Total Players: [length(Lines)]")
	msg = span_filter_notice("[jointext(msg, "<br>")]")
	*/
	msg += span_bold("Всего игроков: [length(Lines)]")
	msg = span_filter_notice("[jointext(msg, "<br>")]")
	// End of Bastion of Endeavor Translation
	to_chat(src,msg)

/client/verb/staffwho()
	/* Bastion of Endeavor Translation
	set category = "Admin"
	set name = "Staffwho"
	*/
	set category = "Администрация"
	set name = "Кто администрирует"
	// End of Bastion of Endeavor Translation

	var/msg = ""
	var/modmsg = ""
	var/devmsg = ""
	var/eventMmsg = ""
	var/num_mods_online = 0
	var/num_admins_online = 0
	var/num_devs_online = 0
	var/num_event_managers_online = 0
	for(var/client/C in GLOB.admins) // VOREStation Edit - GLOB
		var/temp = ""
		var/category = R_ADMIN
		// VOREStation Edit - Apply stealthmin protection to all levels
		if(C.holder.fakekey && !check_rights_for(src, R_ADMIN|R_MOD))	// Only admins and mods can see stealthmins
			continue
		// VOREStation Edit End
		if(check_rights(R_BAN, FALSE, C)) // admins //VOREStation Edit
			num_admins_online++
		else if(check_rights(R_ADMIN, FALSE, C) && !check_rights(R_SERVER, FALSE, C)) // mods //VOREStation Edit: Game masters
			category = R_MOD
			num_mods_online++
		else if(check_rights(R_SERVER, FALSE, C)) // developers
			category = R_SERVER
			num_devs_online++
		else if(check_rights(R_STEALTH, FALSE, C)) // event managers //VOREStation Edit: Retired Staff
			category = R_EVENT
			num_event_managers_online++

		/* Bastion of Endeavor Translation
		temp += "\t[C] is a [C.holder.rank]"
		*/
		temp += "\t[C] – [C.holder.rank]"
		// End of Bastion of Endeavor Translation
		if(holder)
			if(C.holder.fakekey)
				/* Bastion of Endeavor Translation
				temp += " " + span_italics("(as [C.holder.fakekey])")
				*/
				temp += " " + span_italics("(под именем [C.holder.fakekey])")
				// End of Bastion of Endeavor Translation

			/* Bastion of Endeavor Translation
			if(isobserver(C.mob))
				temp += " - Observing"
			else if(istype(C.mob,/mob/new_player))
				temp += " - Lobby"
			else
				temp += " - Playing"
			*/
			if(isobserver(C.mob))
				temp += " – Наблюдает"
			else if(istype(C.mob,/mob/new_player))
				temp += " – В лобби"
			else
				temp += " – В игре"
			// End of Bastion of Endeavor Translation

			if(C.is_afk())
				var/seconds = C.last_activity_seconds()
				/* Bastion of Endeavor Translation
				temp += " (AFK - [round(seconds / 60)] minutes, [seconds % 60] seconds)"
				*/
				temp += " (АФК – [count_ru(round(seconds / 60), "минут;у;ы;")], [count_ru(round(seconds % 60), "секунд;у;ы;")])"
				// End of Bastion of Endeavor Translation
		temp += "\n"
		switch(category)
			if(R_ADMIN)
				msg += temp
			if(R_MOD)
				modmsg += temp
			if(R_SERVER)
				devmsg += temp
			if(R_EVENT)
				eventMmsg += temp

	/* Bastion of Endeavor Translation
	msg = span_bold("Current Admins ([num_admins_online]):") + "\n" + msg
	*/
	msg = span_bold("Администраторы в сети ([num_admins_online]):") + "\n" + msg
	// End of Bastion of Endeavor Translation

	if(CONFIG_GET(flag/show_mods)) // CHOMPEdit
		/* Bastion of Endeavor Translation
		msg += "\n" + span_bold(" Current Moderators ([num_mods_online]):") + "\n" + modmsg	//YW EDIT
		*/
		msg += "\n" + span_bold(" Модераторы ([num_mods_online]):") + "\n" + modmsg	//YW EDIT
		// End of Bastion of Endeavor Translation

	if(CONFIG_GET(flag/show_devs)) // CHOMPEdit
		/* Bastion of Endeavor Translation
		msg += "\n" + span_bold(" Current Developers ([num_devs_online]):") + "\n" + devmsg
		*/
		msg += "\n" + span_bold(" Разработчики ([num_devs_online]):") + "\n" + devmsg
		// End of Bastion of Endeavor Translation

	if(CONFIG_GET(flag/show_event_managers)) // CHOMPEdit
		/* Bastion of Endeavor Translation
		msg += "\n" + span_bold(" Current Miscellaneous ([num_event_managers_online]):") + "\n" + eventMmsg
		*/
		msg += "\n" + span_bold(" Прочий персонал ([num_event_managers_online]):") + "\n" + eventMmsg
		// End of Bastion of Endeavor Translation

	var/num_mentors_online = 0
	var/mmsg = ""

	for(var/client/C in GLOB.mentors)
		num_mentors_online++
		/* Bastion of Endeavor Translation
		mmsg += "\t[C] is a Mentor"
		*/
		mmsg += "\t[C] – Ментор"
		// End of Bastion of Endeavor Translation
		if(holder)
			/* Bastion of Endeavor Translation
			if(isobserver(C.mob))
				mmsg += " - Observing"
			else if(istype(C.mob,/mob/new_player))
				mmsg += " - Lobby"
			else
				mmsg += " - Playing"
			*/
			if(isobserver(C.mob))
				mmsg += " – Наблюдает"
			else if(istype(C.mob,/mob/new_player))
				mmsg += " – В лобби"
			else
				mmsg += " – В игре"
			// End of Bastion of Endeavor Translation

			if(C.is_afk())
				var/seconds = C.last_activity_seconds()
				/* Bastion of Endeavor Translation
				mmsg += " (AFK - [round(seconds / 60)] minutes, [seconds % 60] seconds)"
				*/
				mmsg += " (АФК – [count_ru(round(seconds / 60), "минут;у;ы")], [count_ru(round(seconds % 60), "секунд;у;ы")])"
				// End of Bastion of Endeavor Translation
		mmsg += "\n"

	if(CONFIG_GET(flag/show_mentors)) // CHOMPEdit
		/* Bastion of Endeavor Translation
		msg += "\n" + span_bold(" Current Mentors ([num_mentors_online]):") + "\n" + mmsg
		*/
		msg += "\n" + span_bold(" Менторы в сети ([num_mentors_online]):") + "\n" + mmsg
		// End of Bastion of Endeavor Translation

	/* Bastion of Endeavor Translation
	msg += "\n" + span_info("Adminhelps are also sent to Discord. If no admins are available in game try anyway and an admin on Discord may see it and respond.")
	*/
	msg += "\n" + span_info("Запросы в Помощь администратора дублируются в Discord. Если в сети нет администраторов, вы можете все равно оставить запрос, и кто-то из администраторов может увидеть его в Discord и ответить при первой же возможности.")
	// End of Bastion of Endeavor Translation

	to_chat(src,span_filter_notice("[jointext(msg, "<br>")]"))
