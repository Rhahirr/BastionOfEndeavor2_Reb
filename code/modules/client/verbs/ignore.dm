/client/verb/ignore(key_to_ignore as text)
	/* Bastion of Endeavor Translation
	set name = "Ignore"
	set category = "OOC.Chat Settings"
	set desc = "Makes OOC and Deadchat messages from a specific player not appear to you."
	*/
	set name = "Заблокировать игрока"
	set category = "Предпочтения.Чат"
	set desc = "Скрывать все сообщения в чате OOC и чате мёртвых от определённого игрока."
	// End of Bastion of Endeavor Translation

	if(!key_to_ignore)
		return
	key_to_ignore = ckey(sanitize(key_to_ignore))
	if(prefs && prefs.ignored_players)
		if(key_to_ignore in prefs.ignored_players)
			/* Bastion of Endeavor Translation
			to_chat(usr, span_warning("[key_to_ignore] is already being ignored."))
			*/
			to_chat(usr, span_warning("Вы уже заблокировали [key_to_ignore]."))
			// End of Bastion of Endeavor Translation
			return
		if(key_to_ignore == usr.ckey)
			/* Bastion of Endeavor Translation
			to_chat(usr, span_notice("You can't ignore yourself."))
			*/
			to_chat(usr, span_notice("Вы не можете заблокировать себя."))
			// End of Bastion of Endeavor Translation
			return

		prefs.ignored_players |= key_to_ignore
		SScharacter_setup.queue_preferences_save(prefs)
		/* Bastion of Endeavor Translation
		to_chat(usr, span_notice("Now ignoring <b>[key_to_ignore]</b>."))
		*/
		to_chat(usr, span_notice("Сообщения <b>[key_to_ignore]</b> в чате OOC и чате мёртвых теперь будут скрыты."))
		// End of Bastion of Endeavor Translation

/client/verb/unignore()
	/* Bastion of Endeavor Translation
	set name = "Unignore"
	set category = "OOC.Chat Settings"
	set desc = "Reverts your ignoring of a specific player."
	*/
	set name = "Разблокировать игрока"
	set category = "Предпочтения.Чат"
	set desc = "Перестать скрывать сообщения заблокированного вами игрока."
	// End of Bastion of Endeavor Translation

	if(!prefs)
		/* Bastion of Endeavor Translation
		to_chat(usr, span_warning("Preferences not found."))
		*/
		to_chat(usr, span_warning("Ваши настройки не найдены."))
		// End of Bastion of Endeavor Translation
		return

	if(!prefs.ignored_players?.len)
		/* Bastion of Endeavor Translation
		to_chat(usr, span_warning("You aren't ignoring any players."))
		*/
		to_chat(usr, span_warning("В вашем черном списке нет игроков."))
		// End of Bastion of Endeavor Translation
		return

	/* Bastion of Endeavor Translation
	var/key_to_unignore = tgui_input_list(usr, "Ignored players", "Unignore", prefs.ignored_players)
	*/
	var/key_to_unignore = tgui_input_list(usr, "Заблокированные игроки", "Разблокировать", prefs.ignored_players)
	// End of Bastion of Endeavor Translation
	if(!key_to_unignore)
		return
	key_to_unignore = ckey(sanitize(key_to_unignore))
	if(!(key_to_unignore in prefs.ignored_players))
		/* Bastion of Endeavor Translation
		to_chat(usr, span_warning("[key_to_unignore] isn't being ignored."))
		*/
		to_chat(usr, span_warning("[key_to_unignore] не является заблокированным вами игроком."))
		// End of Bastion of Endeavor Translation
		return
	prefs.ignored_players -= key_to_unignore
	SScharacter_setup.queue_preferences_save(prefs)
	/* Bastion of Endeavor Translation
	to_chat(usr, span_notice("Reverted ignore on <b>[key_to_unignore]</b>."))
	*/
	to_chat(usr, span_notice("Сообщения <b>[key_to_unignore]</b> в чате OOC и чате мёртвых теперь снова будут показываться."))
	// End of Bastion of Endeavor Translation

/mob/proc/is_key_ignored(var/key_to_check)
	if(client)
		return client.is_key_ignored(key_to_check)
	return 0

/client/proc/is_key_ignored(var/key_to_check)
	key_to_check = ckey(key_to_check)
	if(key_to_check in prefs.ignored_players)
		if(GLOB.directory[key_to_check] in GLOB.admins) // This is here so this is only evaluated if someone is actually being blocked.
			return 0
		return 1
	return 0
