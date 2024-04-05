/obj/screen/ai/multicam/Click() 
    if(..()) 
        return 
    var/mob/living/silicon/ai/AI = usr
    AI.toggle_multicam() 
 
/obj/screen/ai/add_multicam/Click() 
    if(..()) 
        return 
    var/mob/living/silicon/ai/AI = usr
    AI.drop_new_multicam() 

/obj/screen/ai/up/Click()
	var/mob/living/silicon/ai/AI = usr
	AI.zMove(UP)

/obj/screen/ai/down/Click()
	var/mob/living/silicon/ai/AI = usr
	AI.zMove(DOWN)

/mob/living/silicon/ai/create_mob_hud(datum/hud/HUD, apply_to_client = TRUE)
	..()

	HUD.ui_style = 'icons/mob/screen_ai.dmi'

	HUD.adding = list()
	HUD.other = list()

	var/obj/screen/using

//AI core
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "AI Core"
	*/
	using.name = "Ядро ИИ"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "ai_core"
	using.screen_loc = ui_ai_core
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Camera list
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "Show Camera List"
	*/
	using.name = "Список камер"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "camera"
	using.screen_loc = ui_ai_camera_list
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Track
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "Track With Camera"
	*/
	using.name = "Отслеживать камерами"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "track"
	using.screen_loc = ui_ai_track_with_camera
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Camera light
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "Toggle Camera Light"
	*/
	using.name = "Включить подсветку камеры"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "camera_light"
	using.screen_loc = ui_ai_camera_light
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Crew Monitoring
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "Crew Monitoring"
	*/
	using.name = "Мониторинг экипажа"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "crew_monitor"
	using.screen_loc = ui_ai_crew_monitor
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Crew Manifest
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "Show Crew Manifest"
	*/
	using.name = "Список экипажа"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "manifest"
	using.screen_loc = ui_ai_crew_manifest
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Alerts
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "Show Alerts"
	*/
	using.name = "Показать тревоги"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "alerts"
	using.screen_loc = ui_ai_alerts
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Announcement
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "Announcement"
	*/
	using.name = "Объявление"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "announcement"
	using.screen_loc = ui_ai_announcement
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Shuttle
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "Call Emergency Shuttle"
	*/
	using.name = "Вызвать аварийный шаттл"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "call_shuttle"
	using.screen_loc = ui_ai_shuttle
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Laws
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "State Laws"
	*/
	using.name = "Перечислить законы"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "state_laws"
	using.screen_loc = ui_ai_state_laws
	using.layer = SCREEN_LAYER
	HUD.adding += using

//PDA message
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "PDA - Send Message"
	*/
	using.name = "КПК - Отправить сообщение"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "pda_send"
	using.screen_loc = ui_ai_pda_send
	using.layer = SCREEN_LAYER
	HUD.adding += using

//PDA log
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "PDA - Show Message Log"
	*/
	using.name = "КПК - История сообщений"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "pda_receive"
	using.screen_loc = ui_ai_pda_log
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Take image
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "Take Image"
	*/
	using.name = "Сфотографировать"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "take_picture"
	using.screen_loc = ui_ai_take_picture
	using.layer = SCREEN_LAYER
	HUD.adding += using

//View images
	using = new /obj/screen()
	/* Bastion of Endeavor Translation
	using.name = "View Images"
	*/
	using.name = "Смотреть фотографии"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "view_images"
	using.screen_loc = ui_ai_view_images
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Multicamera mode 
	using = new /obj/screen/ai/multicam() // special
	/* Bastion of Endeavor Translation
	using.name = "Multicamera Mode"
	*/
	using.name = "Многокамерный режим"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "multicam"
	using.screen_loc = ui_ai_multicam
	using.layer = SCREEN_LAYER
	HUD.adding += using
 
//Add multicamera camera 
	using = new /obj/screen/ai/add_multicam() // special
	/* Bastion of Endeavor Translation
	using.name = "New Camera"
	*/
	using.name = "Добавить камеру"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "new_cam"
	using.screen_loc = ui_ai_add_multicam
	using.layer = SCREEN_LAYER
	HUD.adding += using

//Up and Down
	using = new /obj/screen/ai/up() // special
	/* Bastion of Endeavor Translation
	using.name = "Move Upwards"
	*/
	using.name = "Переместиться вверх"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "up"
	using.screen_loc = ui_ai_updown
	using.layer = SCREEN_LAYER
	HUD.adding += using

	using = new /obj/screen/ai/down() // special
	/* Bastion of Endeavor Translation
	using.name = "Move Downwards"
	*/
	using.name = "Переместиться вниз"
	// End of Bastion of Endeavor Translation
	using.icon = HUD.ui_style
	using.icon_state = "down"
	using.screen_loc = ui_ai_updown
	using.layer = SCREEN_LAYER
	HUD.adding += using
 
	if(client && apply_to_client)
		client.screen = list()
		client.screen += HUD.adding + HUD.other
		client.screen += client.void
