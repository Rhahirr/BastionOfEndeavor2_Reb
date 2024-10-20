/obj/machinery/item_bank
	/* Bastion of Endeavor Translation
	name = "electronic lockbox"
	desc = "A place to store things you might want later!"
	*/
	name = "Персональный сейф"
	desc = "Позволяет сохранять полезности на потом!"
	case_blueprint_ru = list("муж#персональн;adj1a сейф;n1a")
	// End of Bastion of Endeavor Translation
	icon = 'icons/obj/stationobjs_vr.dmi'
	icon_state = "item_bank"
	idle_power_usage = 1
	active_power_usage = 5
	anchored = TRUE
	density = FALSE
	var/busy_bank = FALSE
	var/static/list/item_takers = list()

/obj/machinery/item_bank/proc/persist_item_savefile_path(mob/user)
	return "data/player_saves/[copytext(user.ckey, 1, 2)]/[user.ckey]/persist_item.sav"

/obj/machinery/item_bank/proc/persist_item_savefile_save(mob/user, obj/item/O)
	if(IsGuestKey(user.key))
		return 0

	var/savefile/F = new /savefile(src.persist_item_savefile_path(user))

	F["persist item"] << O.type
	/* Bastion of Endeavor Edit: Unsure how necessary this really is or if this is a good way of doing it but we'll see?
	F["persist name"] << initial(O.name)
	*/
	F["persist name"] << O.name
	F["persist case_blueprint_ru"] << O.case_blueprint_ru
	F["persist number_lock_ru"] << O.number_lock_ru
	F["persist always_plural_ru"] << O.always_plural_ru
	// End of Bastion of Endeavor Edit 

	return 1

/obj/machinery/item_bank/proc/persist_item_savefile_load(mob/user, thing)
	if (IsGuestKey(user.key))
		return 0

	var/path = src.persist_item_savefile_path(user)

	if (!fexists(path))
		return 0

	var/savefile/F = new /savefile(path)

	if(!F) return 0

	var/persist_item
	F["persist item"] >> persist_item

	if (isnull(persist_item) || !ispath(persist_item))
		fdel(path)
		/* Bastion of Endeavor Translation
		tgui_alert_async(user, "An item could not be retrieved.")
		*/
		tgui_alert_async(user, "Не удалось извлечь предмет.")
		// End of Bastion of Endeavor Translation
		return 0
	if(thing == "type")
		return persist_item
	if(thing == "name")
		var/persist_name
		F["persist name"] >> persist_name
		return persist_name
	// Bastion of Endeavor Addition
	if(thing == "case_blueprint_ru")
		var/persist_case_blueprint_ru
		F["persist case_blueprint_ru"] >> persist_case_blueprint_ru
		return persist_case_blueprint_ru
	if(thing == "number_lock_ru")
		var/persist_number_lock_ru
		F["persist number_lock_ru"] >> persist_number_lock_ru
		return persist_number_lock_ru
	if(thing == "always_plural_ru")
		var/persist_always_plural_ru
		F["persist always_plural_ru"] >> persist_always_plural_ru
		return persist_always_plural_ru
	// End of Bastion of Endeavor Addition


/obj/machinery/item_bank/Initialize()
	. = ..()

/obj/machinery/item_bank/attack_hand(mob/living/user)
	. = ..()
	if(!ishuman(user))
		return
	if(istype(user) && Adjacent(user))
		if(inoperable() || panel_open)
			/* Bastion of Endeavor Translation
			to_chat(user, span_warning("\The [src] seems to be nonfunctional..."))
			*/
			to_chat(user, span_warning("Похоже, [interact_ru(src, "не работа;ет;ет;ет;ют;", capital = FALSE)]..."))
			// End of Bastion of Endeavor Translation
		else
			start_using(user)

/obj/machinery/item_bank/proc/start_using(mob/living/user)
	if(!ishuman(user))
		return
	if(busy_bank)
		/* Bastion of Endeavor Translation
		to_chat(user, span_warning("\The [src] is already in use."))
		*/
		to_chat(user, span_warning("[interact_ru(src, "уже кем-то использу;ет;ет;ет;ют;ся.")]"))
		// End of Bastion of Endeavor Translation
		return
	busy_bank = TRUE
	var/I = persist_item_savefile_load(user, "type")
	var/Iname = persist_item_savefile_load(user, "name")
	/* Bastion of Endeavor Translation
	var/choice = tgui_alert(user, "What would you like to do [src]?", "[src]", list("Check contents", "Retrieve item", "Info", "Cancel"), timeout = 10 SECONDS)
	if(!choice || choice == "Cancel" || !Adjacent(user) || inoperable() || panel_open)
	*/
	var/Icase_blueprint_ru = persist_item_savefile_load(user, "case_blueprint_ru")
	var/Ialways_plural_ru = persist_item_savefile_load(user, "always_plural_ru")
	var/Inumber_lock_ru = persist_item_savefile_load(user, "number_lock_ru")
	var/choice = tgui_alert(user, "Что бы вы хотели сделать?", "[src]", list("Проверить содержимое", "Извлечь предмет", "Информация", "Отмена"), timeout = 10 SECONDS)
	if(!choice || choice == "Отмена" || !Adjacent(user) || inoperable() || panel_open)
	// End of Bastion of Endeavor Translation
		busy_bank = FALSE
		return
	/* Bastion of Endeavor Translation
	else if(choice == "Check contents" && I)
		to_chat(user, span_notice("\The [src] has \the [Iname] for you!"))
	*/
	else if(choice == "Проверить содержимое" && I)
		to_chat(user, span_notice("В [concat_ru("ваш;ем;ей;ем;их;", src, PCASE)] – [Iname]!"))
	// End of Bastion of Endeavor Translation
		busy_bank = FALSE
	/* Bastion of Endeavor Translation
	else if(choice == "Retrieve item" && I)
	*/
	else if(choice == "Извлечь предмет" && I)
	// End of Bastion of Endeavor Translation
		if(user.hands_are_full())
			/* Bastion of Endeavor Translation
			to_chat(user,span_notice("Your hands are full!"))
			*/
			to_chat(user,span_notice("Ваши руки заняты!"))
			// End of Bastion of Endeavor Translation
			busy_bank = FALSE
			return
		if(user.ckey in item_takers)
			/* Bastion of Endeavor Translation
			to_chat(user, span_warning("You have already taken something out of \the [src] this shift."))
			*/
			to_chat(user, span_warning("Вы уже извлекали что-то из [gcase_ru(src)] за эту смену."))
			// End of Bastion of Endeavor Translation
			busy_bank = FALSE
			return
		/* Bastion of Endeavor Translation
		choice = tgui_alert(user, "If you remove this item from the bank, it will be unable to be stored again. Do you still want to remove it?", "[src]", list("No", "Yes"), timeout = 10 SECONDS)
		*/
		choice = tgui_alert(user, "Если вы извлечёте предмет из хранилища, то не сможете сложить его обратно. Вы уверены в своём решении?", "[src]", list("Нет", "Да"), timeout = 10 SECONDS)
		// End of Bastion of Endeavor Translation
		icon_state = "item_bank_o"
		/* Bastion of Endeavor Translation
		if(!choice || choice == "No" || !Adjacent(user) || inoperable() || panel_open)
		*/
		if(!choice || choice == "Нет" || !Adjacent(user) || inoperable() || panel_open)
		// End of Bastion of Endeavor Translation
			busy_bank = FALSE
			icon_state = "item_bank"
			return
		else if(!do_after(user, 10 SECONDS, src, exclusive = TASK_ALL_EXCLUSIVE) || inoperable())
			busy_bank = FALSE
			icon_state = "item_bank"
			return
		var/obj/N = new I(get_turf(src))
		/* Bastion of Endeavor Translation: I don't know if its intended that the name does not persist, i'll remove it if it becomes an issue
		log_admin("[key_name_admin(user)] retrieved [N] from the item bank.")
		visible_message(span_notice("\The [src] dispenses the [N] to \the [user]."))
		*/
		N.name = Iname
		N.case_blueprint_ru = Icase_blueprint_ru
		N.always_plural_ru = Ialways_plural_ru
		N.number_lock_ru = Inumber_lock_ru
		N.construct_cases_ru()
		log_admin("[key_name_admin(user)] извлёк [acase_ru(N)] из персонального сейфа.")
		visible_message(span_notice("[interact_ru(src, "выдал", user, case_target = DCASE)] [acase_ru(N)]."))
		// End of Bastion of Endeavor Translation
		user.put_in_hands(N)
		N.persist_storable = FALSE
		var/path = src.persist_item_savefile_path(user)
		var/savefile/F = new /savefile(src.persist_item_savefile_path(user))
		F["persist item"] << null
		F["persist name"] << null
		// Bastion of Endeavor Addition
		F["persist case_blueprint_ru"] << null
		F["persist number_lock_ru"] << null
		F["persist always_plural_ru"] << null
		// End of Bastion of Endeavor Addition
		fdel(path)
		item_takers += user.ckey
		busy_bank = FALSE
		icon_state = "item_bank"
	/* Bastion of Endeavor Translation
	else if(choice == "Info")
		to_chat(user, span_notice("\The [src] can store a single item for you between shifts! Anything that has been retrieved from the bank cannot be stored again in the same shift. Anyone can withdraw from the bank one time per shift. Some items are not able to be accepted by the bank."))
	*/
	else if(choice == "Информация")
		to_chat(user, span_notice("[prep_adv_ru("В", src)] можно сохранить один предмет на будущую смену! Извлечь его можно лишь один раз за смену и нельзя сложить внутрь повторно. Хранилище откажется принимать некоторые предметы."))
	// End of Bastion of Endeavor Translation
		busy_bank = FALSE
		return
	else if(!I)
		/* Bastion of Endeavor Translation
		to_chat(user, span_warning("\The [src] doesn't seem to have anything for you..."))
		*/
		to_chat(user, span_warning("[prep_adv_ru("В", src)] ничего для вас нет..."))
		// End of Bastion of Endeavor Translation
		busy_bank = FALSE

/obj/machinery/item_bank/attackby(obj/item/O, mob/living/user)
	if(!ishuman(user))
		return
	if(busy_bank)
		/* Bastion of Endeavor Translation
		to_chat(user, span_warning("\The [src] is already in use."))
		*/
		to_chat(user, span_warning("[interact_ru(src, "уже кем-то использу;ет;ет;ет;ют;ся.")]"))
		// End of Bastion of Endeavor Translation
		return
	busy_bank = TRUE
	var/I = persist_item_savefile_load(user, "type")
	if(!istool(O) && O.persist_storable)
		if(ispath(I))
			/* Bastion of Endeavor Translation
			to_chat(user, span_warning("You cannot store \the [O]. You already have something stored."))
			*/
			to_chat(user, span_warning("Вы не можете поместить [acase_ru(O)] в хранилище, так как в нём уже что-то есть."))
			// End of Bastion of Endeavor Translation
			busy_bank = FALSE
			return
		/* Bastion of Endeavor Translation
		var/choice = tgui_alert(user, "If you store \the [O], anything it contains may be lost to \the [src]. Are you sure?", "[src]", list("Store", "Cancel"), timeout = 10 SECONDS)
		if(!choice || choice == "Cancel" || !Adjacent(user) || inoperable() || panel_open)
		*/
		var/choice = tgui_alert(user, "Если вы поместите [acase_ru(O)] в хранилище, всё, что содержится внутри [verb_ru(O, ";него;неё;него;них;")], исчезнет. Вы уверены?", "[src]", list("Поместить", "Отмена"), timeout = 10 SECONDS)
		if(!choice || choice == "Отмена" || !Adjacent(user) || inoperable() || panel_open)
		// End of Bastion of Endeavor Translation
			busy_bank = FALSE
			return
		for(var/obj/check in O.contents)
			if(!check.persist_storable)
				/* Bastion of Endeavor Translation
				to_chat(user, span_warning("\The [src] buzzes. \The [O] contains [check], which cannot be stored. Please remove this item before attempting to store \the [O]. As a reminder, any contents of \the [O] will be lost if you store it with contents."))
				*/
				to_chat(user, span_warning("[interact_ru(src, "гуд;ит;ит;ит;ят;")]. [interact_ru(O, "содерж;ит;ит;ит;ат;", check)], [verb_ru(check, "котор;ый;ую;ое;ые;")] нельзя поместить в хранилище. Пожалуйста, уберите [verb_ru(check, ";его;её;его;их;")] из [verb_ru(O, ";него;неё;него;них;")] перед тем, как помещать в хранилище. В качестве напоминания, всё содержимое [gcase_ru(O)] будет удалено после помещения в хранилище."))
				// End of Bastion of Endeavor Translation
				busy_bank = FALSE
				return
		/* Bastion of Endeavor Translation
		user.visible_message(span_notice("\The [user] begins storing \the [O] in \the [src]."),span_notice("You begin storing \the [O] in \the [src]."))
		*/
		user.visible_message(span_notice("[interact_ru(user, "начина;ет;ет;ет;ют; помещать", O)] [prep_adv_ru("в", src, ACASE)]."),span_notice("Вы начинаете помещать [acase_ru(O)] [prep_adv_ru("в", src, ACASE)]."))
		// End of Bastion of Endeavor Translation
		icon_state = "item_bank_o"
		if(!do_after(user, 10 SECONDS, src, exclusive = TASK_ALL_EXCLUSIVE) || inoperable())
			busy_bank = FALSE
			icon_state = "item_bank"
			return
		src.persist_item_savefile_save(user, O)
		/* Bastion of Endeavor Translation
		user.visible_message(span_notice("\The [user] stores \the [O] in \the [src]."),span_notice("You stored \the [O] in \the [src]."))
		log_admin("[key_name_admin(user)] stored [O] in the item bank.")
		*/
		user.visible_message(span_notice("[interact_ru(user, "поместил", O)] [prep_adv_ru("в", src, ACASE)]."),span_notice("Вы поместили [acase_ru(O)] [prep_adv_ru("в", src, ACASE)]."))
		log_admin("[key_name_admin(user)] поместил [acase_ru(O)] в персональный сейф.")
		// End of Bastion of Endeavor Translation
		qdel(O)
		busy_bank = FALSE
		icon_state = "item_bank"
	else
		/* Bastion of Endeavor Translation
		to_chat(user, span_warning("You cannot store \the [O]. \The [src] either does not accept that, or it has already been retrieved from storage this shift."))
		*/
		to_chat(user, span_warning("Вы не можете поместить [acase_ru(O)] в хранилище. Этот предмет либо не допускается к хранению, либо уже был извлечён из хранилища за эту смену."))
		// End of Bastion of Endeavor Translation
		busy_bank = FALSE

/////STORABLE ITEMS AND ALL THAT JAZZ/////
//I am only really intending this to be used for single items. Mostly stuff you got right now, but can't/don't want to use right now.
//It is not at all intended to be a thing that just lets you hold on to stuff forever, but just until it's the right time to use it.

/obj

	var/persist_storable = TRUE		//If this is true, this item can be stored in the item bank.
									//This is automatically set to false when an item is removed from storage

/////LIST OF STUFF WE DON'T WANT PEOPLE STORING/////

/obj/item/pda
	persist_storable = FALSE
/obj/item/communicator
	persist_storable = FALSE
/obj/item/card
	persist_storable = FALSE
/obj/item/holder
	persist_storable = FALSE
/obj/item/radio
	persist_storable = FALSE
/obj/item/encryptionkey
	persist_storable = FALSE
/obj/item/storage			//There are lots of things that have stuff that we may not want people to just have. And this is mostly intended for a single thing.
	persist_storable = FALSE		//And it would be annoying to go through and consider all of them, so default to disabled.
/obj/item/storage/backpack	//But we can enable some where it makes sense. Backpacks and their variants basically never start with anything in them, as an example.
	persist_storable = TRUE
/obj/item/reagent_containers/hypospray/vial
	persist_storable = FALSE
/obj/item/cmo_disk_holder
	persist_storable = FALSE
/obj/item/defib_kit/compact/combat
	persist_storable = FALSE
/obj/item/clothing/glasses/welding/superior
	persist_storable = FALSE
/obj/item/clothing/shoes/magboots/adv
	persist_storable = FALSE
/obj/item/rig
	persist_storable = FALSE
/obj/item/clothing/head/helmet/space/void
	persist_storable = FALSE
/obj/item/clothing/suit/space/void
	persist_storable = FALSE
/obj/item/grab
	persist_storable = FALSE
/obj/item/grenade
	persist_storable = FALSE
/obj/item/hand_tele
	persist_storable = FALSE
/obj/item/paper
	persist_storable = FALSE
/obj/item/backup_implanter
	persist_storable = FALSE
/obj/item/disk/nuclear
	persist_storable = FALSE
/obj/item/gun/energy/locked		//These are guns with security measures on them, so let's say the box won't let you put them in there.
	persist_storable = FALSE			//(otherwise explo will just put their locker/vendor guns into it every round)
/obj/item/retail_scanner
	persist_storable = FALSE
/obj/item/telecube
	persist_storable = FALSE
/obj/item/reagent_containers/glass/bottle/adminordrazine
	persist_storable = FALSE
/obj/item/gun/energy/sizegun/admin
	persist_storable = FALSE
/obj/item/stack
	persist_storable = FALSE
/obj/item/book
	persist_storable = FALSE
/obj/item/melee/cursedblade
	persist_storable = FALSE
/obj/item/circuitboard/mecha/imperion
	persist_storable = FALSE
/obj/item/paicard
	persist_storable = FALSE
/obj/item/organ
	persist_storable = FALSE
/obj/item/soulstone
	persist_storable = FALSE
/obj/item/aicard
	persist_storable = FALSE
/obj/item/mmi
	persist_storable = FALSE
/obj/item/seeds
	persist_storable = FALSE
/obj/item/reagent_containers/food/snacks/grown
	persist_storable = FALSE
/obj/item/stock_parts
	persist_storable = FALSE
/obj/item/rcd
	persist_storable = FALSE
/obj/item/spacecash
	persist_storable = FALSE
/obj/item/spacecasinocash
	persist_storable = FALSE
/obj/item/personal_shield_generator
	persist_storable = FALSE
