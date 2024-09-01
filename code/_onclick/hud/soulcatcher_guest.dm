/obj/screen/nifsc
	icon = 'icons/mob/screen_nifsc.dmi'

/obj/screen/nifsc/MouseEntered(location,control,params)
	flick(icon_state + "_anim", src)
	openToolTip(usr, src, params, title = name, content = desc)

/obj/screen/nifsc/MouseExited()
	closeToolTip(usr)

/obj/screen/nifsc/Click()
	closeToolTip(usr)

/obj/screen/nifsc/reenter
	/* Bastion of Endeavor Translation
	name = "Re-enter NIF"
	desc = "Return into the NIF"
	*/
	name = "Вернуться в НИФ"
	desc = "Войти обратно в НИФ."
	// End of Bastion of Endeavor Translation
	icon_state = "reenter"

/obj/screen/nifsc/reenter/Click()
	..()
	var/mob/living/carbon/brain/caught_soul/CS = usr
	CS.reenter_soulcatcher()

/obj/screen/nifsc/arproj
	/* Bastion of Endeavor Translation
	name = "AR project"
	desc = "Project your form into Augmented Reality for those around your predator with the appearance of your loaded character."
	*/
	name = "Воплотиться в проекции"
	desc = "Проецировать своего текущего персонажа в дополненной реальности рядом с носителем НИФа."
	// End of Bastion of Endeavor Translation
	icon_state = "arproj"

/obj/screen/nifsc/arproj/Click()
        ..()
        var/mob/living/carbon/brain/caught_soul/CS = usr
        CS.ar_project()

/obj/screen/nifsc/jumptoowner
	/* Bastion of Endeavor Translation
	name = "Jump back to host"
	desc = "Jumb back to the Soulcather host"
	*/
	name = "Прыгнуть к носителю"
	desc = "Переместиться к носителю НИФа."
	// End of Bastion of Endeavor Translation
	icon_state = "jump"

/obj/screen/nifsc/jumptoowner/Click()
	..()
	var/mob/living/carbon/brain/caught_soul/CS = usr
	CS.jump_to_owner()

/obj/screen/nifsc/nme
	/* Bastion of Endeavor Translation
	name = "Emote into Soulcatcher"
	desc = "Emote into the NIF's Soulcatcher (circumventing AR emoting)"
	*/
	name = "Действие в Ловце душ"
	desc = "Отправить действие в Ловец душ НИФа (вместо действия через проекцию)."
	// End of Bastion of Endeavor Translation
	icon_state = "nme"

/obj/screen/nifsc/nme/Click()
	..()
	var/mob/living/carbon/brain/caught_soul/CS = usr
	CS.nme_brain() //CHOMPEdit

/obj/screen/nifsc/nsay
	/* Bastion of Endeavor Translation
	name = "Speak into Soulcatcher"
	desc = "Speak into the NIF's Soulcatcher (circumventing AR speaking)"
	*/
	name = "Сказать в Ловце душ"
	desc = "Сказать вслух в Ловце душ НИФа (вместо речи через проекцию)."
	// End of Bastion of Endeavor Translation
	icon_state = "nsay"

/obj/screen/nifsc/nsay/Click()
	..()
	var/mob/living/carbon/brain/caught_soul/CS = usr
	CS.nsay_brain() //CHOMPEdit


/mob/living/carbon/brain/caught_soul/create_mob_hud(datum/hud/HUD, apply_to_client = TRUE)
	..()

	var/list/adding = list()
	HUD.adding = adding

	var/obj/screen/using

	using = new /obj/screen/nifsc/reenter()
	using.screen_loc = ui_nifsc_reenter
	using.hud = src
	adding += using

	using = new /obj/screen/nifsc/arproj()
	using.screen_loc = ui_nifsc_arproj
	using.hud = src
	adding += using

	using = new /obj/screen/nifsc/jumptoowner()
	using.screen_loc = ui_nifsc_jumptoowner
	using.hud = src
	adding += using

	using = new /obj/screen/nifsc/nme()
	using.screen_loc = ui_nifsc_nme
	using.hud = src
	adding += using

	using = new /obj/screen/nifsc/nsay()
	using.screen_loc = ui_nifsc_nsay
	using.hud = src
	adding += using


	if(client && apply_to_client)
		client.screen = list()
		client.screen += HUD.adding
		client.screen += client.void
