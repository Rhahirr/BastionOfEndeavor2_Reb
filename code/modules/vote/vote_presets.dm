/datum/vote/crew_transfer
	/* Bastion of Endeavor Translation
	question = "End the shift"
	choices = list("Initiate Crew Transfer", "Extend The Shift")
	vote_type_text = "crew transfer"
	*/
	question = "Завершить смену"
	choices = list("Начать трансфер экипажа", "Продлить смену на час")
	vote_type_text = "голосование за трансфер экипажа"
	// End of Bastion of Endeavor Translation
	vote_result_type = VOTE_RESULT_TYPE_SKEWED

/datum/vote/crew_transfer/New()
	if(SSticker.current_state < GAME_STATE_PLAYING)
		/* Bastion of Endeavor Translation
		CRASH("Attempted to call a shutle vote before the game starts!")
		*/
		CRASH("Попытка вызвать голосование за шаттл до начала игры!")
		// End of Bastion of Endeavor Translation
	..()

/datum/vote/crew_transfer/handle_result(result)
	/* Bastion of Endeavor Translation
	if(result == "Initiate Crew Transfer")
	*/
	if(result == "Начать трансфер экипажа")
	// End of Bastion of Endeavor Translation
		init_shift_change(null, TRUE)
