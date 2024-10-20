/client/verb/toggle_be_special(role in be_special_flags)
	/* Bastion of Endeavor Translation
	set name = "Toggle Special Role Candidacy"
	set category = "Preferences.Character" //CHOMPEdit
	set desc = "Toggles which special roles you would like to be a candidate for, during events."
	*/
	set name = "Кандидатура на особые роли"
	set category = "Предпочтения.Персонаж"
	set desc = "Позволяет выбрать, на какие особые роли выставить вашу кандидатуру во время событий."
	// End of Bastion of Endeavor Translation

	var/role_flag = be_special_flags[role]
	if(!role_flag)	return

	prefs.be_special ^= role_flag
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [(prefs.be_special & role_flag) ? "now" : "no longer"] be considered for [role] events (where possible).")
	*/
	to_chat(src,"Вы [(prefs.be_special & role_flag) ? "теперь" : "больше не"] будете учтены при подборе игроков на роль '[role]'.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TBeSpecial") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/* Bastion of Endeavor Removal: TGChat handles this
/client/verb/toggle_chat_timestamps()
	/* Bastion of Endeavor Translation
	set name = "Toggle Chat Timestamps"
	set category = "Preferences.Chat" //CHOMPEdit
	set desc = "Toggles whether or not messages in chat will display timestamps. Enabling this will not add timestamps to messages that have already been sent."
	*/
	set name = "Отметки времени"
	set category = "Предпочтения.Чат"
	set desc = "Переключить отображение отметок времени в сообщениях чата."
	// End of Bastion of Endeavor Translation

	prefs.chat_timestamp = !prefs.chat_timestamp	//There is no preference datum for tgui input lock, nor for any TGUI prefs.
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src, span_notice("You have toggled chat timestamps: [prefs.chat_timestamp ? "ON" : "OFF"]."))
	*/
	to_chat(src, span_notice("Сообщения в чате [prefs.chat_timestamp ? "теперь" : "больше не"] будут подписаны отметками времени."))
	// End of Bastion of Endeavor Translation
*/
// End of Bastion of Endeavor Removal

// Not attached to a pref datum because those are strict binary toggles
/client/verb/toggle_examine_mode()
	/* Bastion of Endeavor Translation
	set name = "Toggle Examine Mode"
	set category = "Preferences.Game" //CHOMPEdit
	set desc = "Toggle the additional behaviour of examining things."
	*/
	set name = "Режим осмотра"
	set category = "Предпочтения.Игра"
	set desc = "Переключить режим глагола Осмотреть."
	// End of Bastion of Endeavor Translation

	prefs.examine_text_mode++
	prefs.examine_text_mode %= EXAMINE_MODE_MAX // This cycles through them because if you're already specifically being routed to the examine panel, you probably don't need to have the extra text printed to chat
	switch(prefs.examine_text_mode)				// ... And I only wanted to add one verb
		/* Bastion of Endeavor Translation
		if(EXAMINE_MODE_DEFAULT)
			to_chat(src, span_filter_system("Examining things will only output the base examine text, and you will not be redirected to the examine panel automatically."))

		if(EXAMINE_MODE_INCLUDE_USAGE)
			to_chat(src, span_filter_system("Examining things will also print any extra usage information normally included in the examine panel to the chat."))

		if(EXAMINE_MODE_SWITCH_TO_PANEL)
			to_chat(src, span_filter_system("Examining things will direct you to the examine panel, where you can view extended information about the thing."))
		*/
		if(EXAMINE_MODE_DEFAULT)
			to_chat(src, span_filter_system("Теперь при осмотре в чате будет отображаться только основное название и описание вместо панели Осмотра."))

		if(EXAMINE_MODE_INCLUDE_USAGE)
			to_chat(src, span_filter_system("Теперь при осмотре в чате будет отображаться дополнительная информация с панели Осмотра."))

		if(EXAMINE_MODE_SWITCH_TO_PANEL)
			to_chat(src, span_filter_system("Теперь при осмотре будет открываться панель Осмотра, предоставляющая дополнительную информацию."))
		// End of Bastion of Endeavor Translation

/client/verb/toggle_multilingual_mode()
	/* Bastion of Endeavor Translation
	set name = "Toggle Multilingual Mode"
	set category = "Preferences.Character" //CHOMPEdit
	set desc = "Toggle the behaviour of multilingual speech parsing."
	*/
	set name = "Режим многоязычия"
	set category = "Предпочтения.Персонаж"
	set desc = "Переключить режим обработки речи на нескольких языках сразу."
	// End of Bastion of Endeavor Translation

	prefs.multilingual_mode++
	prefs.multilingual_mode %= MULTILINGUAL_MODE_MAX // Cycles through the various options
	switch(prefs.multilingual_mode)
		/* Bastion of Endeavor Translation
		if(MULTILINGUAL_DEFAULT)
			to_chat(src, span_filter_system("Multilingual parsing will only check for the delimiter-key combination (,0galcom-2tradeband)."))
		if(MULTILINGUAL_SPACE)
			to_chat(src, span_filter_system("Multilingual parsing will enforce a space after the delimiter-key combination (,0 galcom -2still galcom). The extra space will be consumed by the pattern-matching."))
		if(MULTILINGUAL_DOUBLE_DELIMITER)
			to_chat(src, span_filter_system("Multilingual parsing will enforce the a language delimiter after the delimiter-key combination (,0,galcom -2 still galcom). The extra delimiter will be consumed by the pattern-matching."))
		if(MULTILINGUAL_OFF)
			to_chat(src, span_filter_system("Multilingual parsing is now disabled. Entire messages will be in the language specified at the start of the message."))
		*/
		if(MULTILINGUAL_DEFAULT)
			to_chat(src, span_filter_system("При обработке языков теперь требуется только комбинация разделителя-клавиши (,0Общегалактический-2Торговый диалект)."))
		if(MULTILINGUAL_SPACE)
			to_chat(src, span_filter_system("При обработке языков теперь требуется пробел после комбинации разделителя-клавиши (,0 Общегалактический -2Всё ещё общегалактический). Этот пробел будет удалён из самого сообщения."))
		if(MULTILINGUAL_DOUBLE_DELIMITER)
			to_chat(src, span_filter_system("При обработке языков теперь требуется дополнительный разделитель после комбинации разделителя-клавиши (,0,Общегалактический -2 Всё ещё общегалактический). Этот разделитель будет удалён из самого сообщения."))
		if(MULTILINGUAL_OFF)
			to_chat(src, span_filter_system("Многоязычие теперь отключено. Теперь все сообщения будут полностью на языке, указанном в самом начале сообщения."))
		// End of Bastion of Endeavor Translation
