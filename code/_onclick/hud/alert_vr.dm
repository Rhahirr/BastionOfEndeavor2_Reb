/obj/screen/alert/fat
	/* Bastion of Endeavor Translation
	name = "Full"
	desc = "You overate! If you don't exercise soon, you might find yourself gaining weight."
	*/
	name = "Сытость"
	desc = "Вы переели! Если не отработаете все эти калории, то вскоре можете начать набирать вес."
	// End of Bastion of Endeavor Translation

/obj/screen/alert/fat/vampire
	/* Bastion of Endeavor Translation
	desc = "You overdrank! If you don't exercise soon, you might find yourself gaining weight."
	*/
	desc = "Вы выпили слишком много крови! Если не отработаете все эти калории, то вскоре можете начать набирать вес."
	// End of Bastion of Endeavor Translation

/obj/screen/alert/fat/synth
	/* Bastion of Endeavor Translation
	name = "Overcharged"
	*/
	name = "Избыточный заряд"
	// End of Bastion of Endeavor Translation

/obj/screen/alert/hungry/vampire
	/* Bastion of Endeavor Translation
	desc = "You could use a bloodpack or two."
	*/
	desc = "Вы бы не отказались от пакетика крови."
	// End of Bastion of Endeavor Translation

/obj/screen/alert/hungry/synth
	/* Bastion of Endeavor Translation
	name = "Undercharged"
	*/
	name = "Недостаточный заряд"
	// End of Bastion of Endeavor Translation

/obj/screen/alert/starving
	/* Bastion of Endeavor Translation
	desc = "You're extremely hungry. The hunger pains make moving around a chore."
	*/
	desc = "Вы крайне голодны. Стонущий желудок затрудняет ваше передвижение."
	// End of Bastion of Endeavor Translation

/obj/screen/alert/starving/vampire
	/* Bastion of Endeavor Translation
	desc = "You are starving! Without some blood, moving around is a pain."
	*/
	desc = "Вы крайне голодны. Без крови вам очень трудно двигаться."
	// End of Bastion of Endeavor Translation

/obj/screen/alert/starving/synth
	/* Bastion of Endeavor Translation
	name = "Low Power"
	desc = "Your battery is very low! Low power mode makes all movements slower."
	*/
	name = "Низкий заряд"
	desc = "Ваш аккумулятор садится! Ваше передвижение затруднено."
	// End of Bastion of Endeavor Translation
	
/obj/screen/alert/xenochimera/reconstitution
	/* Bastion of Endeavor Translation
	name = "Reconstructing Form"
	desc = "You're still rebuilding your body! Click the alert to find out how long you have left."
	*/
	name = "Воссоздание формы"
	desc = "Вы перестраиваете своё тело! Нажмите сюда, чтобы узнать, сколько времени осталось."
	// End of Bastion of Endeavor Translation
	icon_state = "regenerating"

/* // Commenting this out for now, will revisit later once I can figure out how to override Click() appropriately.
/obj/screen/alert/xenochimera/reconstitution/Click(mob/usr)
	var/mob/living/carbon/human/H = usr
	if(istype(H) && istype(H.species, /datum/species/xenochimera)) // If you're somehow able to click this while not a chimera, this should prevent weird runtimes. Will need changing if regeneration is ever opened to non-chimera using the same alert.
		if(H.revive_ready == REVIVING_NOW)
			to_chat(usr, "We are currently reviving, and will be done in [(H.revive_finished - world.time) / 10] seconds.")
		else if(H.revive_ready == REVIVING_DONE)
			to_chat(usr, "You should have a notification + alert for this! Bug report that this is still here!")
*/
			
/obj/screen/alert/xenochimera/readytohatch
	/* Bastion of Endeavor Translation
	name = "Ready to Hatch"
	desc = "You're done reconstructing your cells! Click me to Hatch!"
	*/
	name = "Готовность вылупиться"
	desc = "Вы закончили перестраивать свою клеточную структуру! Нажмите сюда, чтобы вылупиться!"
	// End of Bastion of Endeavor Translation
	icon_state = "hatch_ready"

/*	// Commenting this out for now, will revisit later once I can figure out how to override Click() appropriately.
/obj/screen/alert/xenochimera/readytohatch/Click(mob/usr)
	var/mob/living/carbon/human/H = usr
	if(istype(H) && istype(H.species, /datum/species/xenochimera)) // If you're somehow able to click this while not a chimera, this should prevent weird runtimes. Will need changing if regeneration is ever opened to non-chimera using the same alert.
		if(H.revive_ready == REVIVING_DONE) // Sanity check.
			H.hatch() // Hatch.
*/
