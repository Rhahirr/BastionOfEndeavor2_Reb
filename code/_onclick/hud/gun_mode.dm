/obj/screen/gun
	/* Bastion of Endeavor Translation
	name = "gun"
	*/ 
	name = "Оружие"
	// End of Bastion of Endeavor Translation
	/* Bastion of Endeavor Edit: Russian icons. Not sure if used.
	icon = 'icons/mob/screen1.dmi'
	*/
	icon = 'russian/_modular/icons/mob/screen1_ru.dmi'
	// End of Bastion of Endeavor Edit
	master = null
	dir = 2

/obj/screen/gun/Click(location, control, params)
	if(!usr)
		return
	return 1

/obj/screen/gun/move
	/* Bastion of Endeavor Translation
	name = "Allow Movement"
	*/ 
	name = "Разрешить передвижение"
	// End of Bastion of Endeavor Translation
	icon_state = "no_walk0"
	screen_loc = ui_gun2

/obj/screen/gun/move/Click(location, control, params)
	if(..())
		var/mob/living/user = usr
		if(istype(user))
			if(!user.aiming) user.aiming = new(user)
			user.aiming.toggle_permission(TARGET_CAN_MOVE)
		return 1
	return 0

/obj/screen/gun/item
	/* Bastion of Endeavor Translation
	name = "Allow Item Use"
	*/ 
	name = "Разрешить использование предметов"
	// End of Bastion of Endeavor Translation
	icon_state = "no_item0"
	screen_loc = ui_gun1

/obj/screen/gun/item/Click(location, control, params)
	if(..())
		var/mob/living/user = usr
		if(istype(user))
			if(!user.aiming) user.aiming = new(user)
			user.aiming.toggle_permission(TARGET_CAN_CLICK)
		return 1
	return 0

/obj/screen/gun/mode
	/* Bastion of Endeavor Translation
	name = "Toggle Gun Mode"
	*/ 
	name = "Режим оружия"
	// End of Bastion of Endeavor Translation
	icon_state = "gun0"
	screen_loc = ui_gun_select

/obj/screen/gun/mode/Click(location, control, params)
	if(..())
		var/mob/living/user = usr
		if(istype(user))
			if(!user.aiming) user.aiming = new(user)
			user.aiming.toggle_active()
		return 1
	return 0

/obj/screen/gun/radio
	/* Bastion of Endeavor Translation
	name = "Allow Radio Use"
	*/ 
	name = "Разрешить использование рации"
	// End of Bastion of Endeavor Translation
	icon_state = "no_radio0"
	screen_loc = ui_gun4

/obj/screen/gun/radio/Click(location, control, params)
	if(..())
		var/mob/living/user = usr
		if(istype(user))
			if(!user.aiming) user.aiming = new(user)
			user.aiming.toggle_permission(TARGET_CAN_RADIO)
		return 1
	return 0
