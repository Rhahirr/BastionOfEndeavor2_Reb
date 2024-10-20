/mob/var/suiciding = 0

/mob/living/carbon/human/verb/suicide() /// At best, useful for admins to see if it's being called.
	set hidden = 1

	if (stat == DEAD)
		/* Bastion of Endeavor Translation
		to_chat(src, "You're already dead!")
		*/
		to_chat(src, "Вы уже мертвы!")
		// End of Bastion of Endeavor Translation
		return

	if (!ticker)
		/* Bastion of Endeavor Translation
		to_chat(src, "You can't commit suicide before the game starts!")
		*/
		to_chat(src, "Вы не можете покончить с собой до начала игры!")
		// End of Bastion of Endeavor Translation
		return
	
	/* Bastion of Endeavor Translation
	to_chat(src, span_warning("No. Adminhelp if there is a legitimate reason, and please review our server rules."))
	message_admins("[ckey] has tried to trigger the suicide verb as human, but it is currently disabled.")
	*/
	to_chat(src, span_warning("Нет уж. Обратитесь в Помощь администратора, если у вас действительно есть на это причина, и перечитайте заодно правила."))
	message_admins("[ckey] попытался использовать глагол Самоубийства будучи человеком. Этот глагол отключён.")
	// End of Bastion of Endeavor Translation

/mob/living/carbon/brain/verb/suicide()
	set hidden = 1

	if (stat == 2)
		/* Bastion of Endeavor Translation
		to_chat(src, "You're already dead!")
		*/
		to_chat(src, "Вы уже мертвы!")
		// End of Bastion of Endeavor Translation
		return

	if (!ticker)
		/* Bastion of Endeavor Translation
		to_chat(src, "You can't commit suicide before the game starts!")
		*/
		to_chat(src, "Вы не можете покончить с собой до начала игры!")
		// End of Bastion of Endeavor Translation
		return

	if (suiciding)
		/* Bastion of Endeavor Translation
		to_chat(src, "You're already committing suicide! Be patient!")
		*/
		to_chat(src, "Вы уже в процессе самоубийства! Подождите немного!")
		// End of Bastion of Endeavor Translation
		return

	/* Bastion of Endeavor Translation
	var/confirm = tgui_alert(usr, "Are you sure you want to commit suicide?", "Confirm Suicide", list("Yes", "No"))
	*/
	var/confirm = tgui_alert(usr, "Вы действительно хотите покончить с собой?", "Самоубийство", list("Да", "Нет"))
	// End of Bastion of Endeavor Translation

	/* Bastion of Endeavor Translation
	if(confirm == "Yes")
		suiciding = 1
		to_chat(viewers(loc),span_danger("[src]'s brain is growing dull and lifeless. It looks like it's lost the will to live."))
	*/
	if(confirm == "Да")
		suiciding = 1
		/* Bastion of Endeavor Translation
		to_chat(viewers(loc),span_danger("[src]'s brain is growing dull and lifeless. It looks like it's lost the will to live."))
		*/
		to_chat(viewers(loc),span_danger("Похоже, [acase_ru(src)] оставили все силы. На ваших глазах [verb_ru(src, "он")] [verb_ru(src, "потерял")] всякое желание жить."))
		// End of Bastion of Endeavor Translation
	// End of Bastion of Endeavor Translation
		spawn(50)
			death(0)
			suiciding = 0

/mob/living/silicon/ai/verb/suicide()
	set hidden = 1

	if (stat == 2)
		/* Bastion of Endeavor Translation
		to_chat(src, "You're already dead!")
		*/
		to_chat(src, "Вы уже мертвы!")
		// End of Bastion of Endeavor Translation
		return

	if (suiciding)
		/* Bastion of Endeavor Translation
		to_chat(src, "You're already committing suicide! Be patient!")
		*/
		to_chat(src, "Вы уже в процессе самоубийства! Подождите немного!")
		// End of Bastion of Endeavor Translation
		return

	/* Bastion of Endeavor Translation
	var/confirm = tgui_alert(usr, "Are you sure you want to commit suicide?", "Confirm Suicide", list("Yes", "No"))
	*/
	var/confirm = tgui_alert(usr, "Вы действительно хотите покончить с собой?", "Самоубийство", list("Да", "Нет"))
	// End of Bastion of Endeavor Translation

	/* Bastion of Endeavor Translation
	if(confirm == "Yes")
		suiciding = 1
		to_chat(viewers(src),span_danger("[src] is powering down. It looks like they're trying to commit suicide."))
	*/
	if(confirm == "Да")
		suiciding = 1
		to_chat(viewers(src),span_danger("[cap_ru(src)] [verb_ru(src, "начина;ет;ет;ет;ют;")] отключаться. Похоже, навсегда."))
	// End of Bastion of Endeavor Translation
		//put em at -175
		adjustOxyLoss(max(getMaxHealth() * 2 - getToxLoss() - getFireLoss() - getBruteLoss() - getOxyLoss(), 0))
		updatehealth()

/mob/living/silicon/robot/verb/suicide()
	set hidden = 1

	if (stat == 2)
		/* Bastion of Endeavor Translation
		to_chat(src, "You're already dead!")
		*/
		to_chat(src, "Вы уже мертвы!")
		// End of Bastion of Endeavor Translation
		return

	if (suiciding)
		/* Bastion of Endeavor Translation
		to_chat(src, "You're already committing suicide! Be patient!")
		*/
		to_chat(src, "Вы уже в процессе самоубийства! Подождите немного!")
		// End of Bastion of Endeavor Translation
		return

	/* Bastion of Endeavor Translation
	var/confirm = tgui_alert(usr, "Are you sure you want to commit suicide?", "Confirm Suicide", list("Yes", "No"))
	*/
	var/confirm = tgui_alert(usr, "Вы действительно хотите покончить с собой?", "Самоубийство", list("Да", "Нет"))
	// End of Bastion of Endeavor Translation

	/* Bastion of Endeavor Translation
	if(confirm == "Yes")
		suiciding = 1
		to_chat(viewers(src),span_danger("[src] is powering down. It looks like they're trying to commit suicide."))
	*/
	if(confirm == "Да")
		suiciding = 1
		to_chat(viewers(src),span_danger("[cap_ru(src)] [verb_ru(src, "начина;ет;ет;ет;ют;")] отключаться. Похоже, навсегда."))
	// End of Bastion of Endeavor Translation
		//put em at -175
		adjustOxyLoss(max(getMaxHealth() * 2 - getToxLoss() - getFireLoss() - getBruteLoss() - getOxyLoss(), 0))
		updatehealth()

/*
/mob/living/silicon/pai/verb/suicide()
	set category = "pAI Commands"
	set desc = "Kill yourself and become a ghost (You will receive a confirmation prompt)"
	set name = "pAI Suicide"
	var/answer = tgui_alert(usr, "REALLY kill yourself? This action can't be undone.", "Suicide", list("Yes","No"))
	if(answer == "Yes")
		var/obj/item/paicard/card = loc
		card.removePersonality()
		var/turf/T = get_turf_or_move(card.loc)
		for (var/mob/M in viewers(T))
			M.show_message(span_notice("[src] flashes a message across its screen, \"Wiping core files. Please acquire a new personality to continue using pAI device functions.\""), 3, span_notice("[src] bleeps electronically."), 2)
		death(0)
	else
		to_chat(src, "Aborting suicide attempt.")
*/
