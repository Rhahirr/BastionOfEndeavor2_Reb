/mob/living/carbon/alien/create_mob_hud(datum/hud/HUD, apply_to_client = TRUE)
	..()

	/* Bastion of Endeaovor Edit: Russian icons. Currently unchanged, but might be done later if need be.
	HUD.ui_style = 'icons/mob/screen1_alien.dmi'
	*/
	HUD.ui_style = 'russian/_modular/icons/mob/screen1_alien_ru.dmi'
	// End of Bastion of Endeavor Edit

	HUD.adding = list()
	HUD.other = list()

	var/obj/screen/using

	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "mov_intent"
	*/
	using.name = "Передвижение"
	// End of Bastion of Endeavor Translation
	using.set_dir(SOUTHWEST)
	using.icon = HUD.ui_style
	using.icon_state = (m_intent == "run" ? "running" : "walking")
	using.screen_loc = ui_acti
	using.layer = HUD_LAYER
	HUD.adding += using
	HUD.move_intent = using

	healths = new /obj/screen()
	healths.icon = HUD.ui_style
	healths.icon_state = "health0"
	/* Bastion of Endeavor Translation
	healths.name = "health"
	*/
	healths.name = "Здоровье"
	// End of Bastion of Endeavor Translation
	healths.screen_loc = ui_alien_health

	if(client && apply_to_client)
		client.screen = list()
		client.screen += list(healths)
		client.screen += HUD.adding + HUD.other
		client.screen += client.void
