/client/verb/vote()
	/* Bastion of Endeavor Translation
	set category = "OOC.Game" // CHOMPedit
	set name = "Vote"
	*/
	set category = "OOC.Игра"
	set name = "Голосование"
	// End of Bastion of Endeavor Translation

	if(SSvote.active_vote)
		SSvote.active_vote.tgui_interact(usr)
	else
		/* Bastion of Endeavor Translation
		to_chat(usr, span_warning("There is no active vote"))
		*/
		to_chat(usr, span_warning("На данный момент не проводится голосование."))
		// End of Bastion of Endeavor Translation

/client/proc/start_vote()
	/* Bastion of Endeavor Translation
	set category = "Admin.Game" // CHOMPEdit
	set name = "Start Vote"
	set desc = "Start a vote on the server"
	*/
	set category = "Администрация.Игра"
	set name = "Инициировать голосование"
	set desc = "Начать голосование."
	// End of Bastion of Endeavor Translation

	if(!is_admin())
		return

	if(SSvote.active_vote)
		/* Bastion of Endeavor Translation
		to_chat(usr, span_warning("A vote is already in progress"))
		*/
		to_chat(usr, span_warning("На данный момент уже проводится голосование."))
		// End of Bastion of Endeavor Translation
		return

	var/vote_types = subtypesof(/datum/vote)
	/* Bastion of Endeavor Translation
	vote_types |= "\[CUSTOM]"
	*/
	vote_types |= "\[ОСОБОЕ]"
	// End of Bastion of Endeavor Translation

	var/list/votemap = list()
	for(var/vtype in vote_types)
		votemap["[vtype]"] = vtype

	/* Bastion of Endeavor Translation
	var/choice = tgui_input_list(usr, "Select a vote type", "Vote", vote_types)
	*/
	var/choice = tgui_input_list(usr, "Выберите тип голосования:", "Голосование", vote_types)
	// End of Bastion of Endeavor Translation

	if(choice == null)
		return

	/* Bastion of Endeavor Translation
	if(choice != "\[CUSTOM]")
	*/
	if(choice != "\[ОСОБОЕ]")
	// End of Bastion of Endeavor Translation
		var/datum/votetype = votemap["[choice]"]
		SSvote.start_vote(new votetype(usr.ckey))
		return

	/* Bastion of Endeavor Translation
	var/question = tgui_input_text(usr, "What is the vote for?", "Create Vote", encode = FALSE)
	*/
	var/question = tgui_input_text(usr, "За что голосуем?", "Голосование", encode = FALSE)
	// End of Bastion of Endeavor Translation
	if(isnull(question))
		return

	var/list/choices = list()
	for(var/i in 1 to 10)
		/* Bastion of Endeavor Translation
		var/option = tgui_input_text(usr, "Please enter an option or hit cancel to finish", "Create Vote", encode = FALSE)
		*/
		var/option = tgui_input_text(usr, "Пожалуйста, введите вариант ответа или нажмите Отмена, чтобы закончить:", "Голосование", encode = FALSE)
		// End of Bastion of Endeavor Translation
		if(isnull(option) || !usr.client)
			break
		choices |= option

	/* Bastion of Endeavor Translation
	var/c2 = tgui_alert(usr, "Show counts while vote is happening?", "Counts", list("Yes", "No"))
	var/c3 = input(usr, "Select a result calculation type", "Vote", VOTE_RESULT_TYPE_MAJORITY) as anything in list(VOTE_RESULT_TYPE_MAJORITY)
	*/
	var/c2 = tgui_alert(usr, "Отображать результаты в течение голосования?", "Голосование", list("Да", "Нет"))
	var/c3 = input(usr, "Введите критерий выбора победителя:", "Голосование", VOTE_RESULT_TYPE_MAJORITY) as anything in list(VOTE_RESULT_TYPE_MAJORITY)
	// End of Bastion of Endeavor Translation

	var/datum/vote/V = new /datum/vote(usr.ckey, question, choices, TRUE)
	/* Bastion of Endeavor Translation
	V.show_counts = (c2 == "Yes")
	*/
	V.show_counts = (c2 == "Да")
	// End of Bastion of Endeavor Translation
	V.vote_result_type = c3
	SSvote.start_vote(V)
