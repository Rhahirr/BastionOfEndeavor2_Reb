var/list/_client_preferences
var/list/_client_preferences_by_key
var/list/_client_preferences_by_type

/proc/get_client_preferences()
	if(!_client_preferences)
		_client_preferences = list()
		for(var/datum/client_preference/client_type as anything in subtypesof(/datum/client_preference))
			if(initial(client_type.description))
				_client_preferences += new client_type()
	return _client_preferences

/proc/get_client_preference(var/datum/client_preference/preference)
	if(istype(preference))
		return preference
	if(ispath(preference))
		return get_client_preference_by_type(preference)
	return get_client_preference_by_key(preference)

/proc/get_client_preference_by_key(var/preference)
	if(!_client_preferences_by_key)
		_client_preferences_by_key = list()
		for(var/datum/client_preference/client_pref as anything in get_client_preferences())
			_client_preferences_by_key[client_pref.key] = client_pref
	return _client_preferences_by_key[preference]

/proc/get_client_preference_by_type(var/preference)
	if(!_client_preferences_by_type)
		_client_preferences_by_type = list()
		for(var/datum/client_preference/client_pref as anything in get_client_preferences())
			_client_preferences_by_type[client_pref.type] = client_pref
	return _client_preferences_by_type[preference]

/datum/client_preference
	var/description
	var/key
	var/enabled_by_default = TRUE
	/* Bastion of Endeavor Translation
	var/enabled_description = "Yes"
	var/disabled_description = "No"
	*/
	var/enabled_description = "Включены"
	var/disabled_description = "Отключены"
	// End of Bastion of Endeavor Translation

/datum/client_preference/proc/may_toggle(var/mob/preference_mob)
	return TRUE

/datum/client_preference/proc/toggled(var/mob/preference_mob, var/enabled)
	return

/*********************
* Player Preferences *
*********************/

/datum/client_preference/play_admin_midis
	/* Bastion of Endeavor Translation
	description ="Play admin midis"
	*/
	description ="Музыка от администраторов"
	enabled_description = "Воспроизводить"
	disabled_description = "Заглушить"
	// End of Bastion of Endeavor Translation
	key = "SOUND_MIDI"

/datum/client_preference/play_lobby_music
	/* Bastion of Endeavor Translation
	description ="Play lobby music"
	*/
	description ="Музыка в лобби"
	enabled_description = "Включена"
	disabled_description = "Отключена"
	// End of Bastion of Endeavor Translation
	key = "SOUND_LOBBY"

/datum/client_preference/play_lobby_music/toggled(var/mob/preference_mob, var/enabled)
	if(!preference_mob.client || !preference_mob.client.media)
		return

	if(enabled)
		preference_mob.client.playtitlemusic()
	else
		preference_mob.client.media.stop_music()

/datum/client_preference/play_ambiance
	/* Bastion of Endeavor Translation
	description ="Play ambience"
	*/
	description ="Звуки окружения"
	// End of Bastion of Endeavor Translation
	key = "SOUND_AMBIENCE"

/datum/client_preference/play_ambiance/toggled(var/mob/preference_mob, var/enabled)
	if(!enabled)
		preference_mob << sound(null, repeat = 0, wait = 0, volume = 0, channel = 1)
		preference_mob << sound(null, repeat = 0, wait = 0, volume = 0, channel = 2)
//VOREStation Add - Need to put it here because it should be ordered riiiight here.
/datum/client_preference/play_jukebox
	/* Bastion of Endeavor Translation
	description ="Play jukebox music"
	*/
	description ="Звуки музыкального автомата"
	// End of Bastion of Endeavor Translation
	key = "SOUND_JUKEBOX"

/datum/client_preference/play_jukebox/toggled(var/mob/preference_mob, var/enabled)
	if(!enabled)
		preference_mob.stop_all_music()
	else
		preference_mob.update_music()

/datum/client_preference/eating_noises
	/* Bastion of Endeavor Translation
	description = "Eating Noises"
	key = "EATING_NOISES"
	enabled_description = "Noisy"
	disabled_description = "Silent"
	*/
	description = "Звуки поедания"
	key = "EATING_NOISES"
	// End of Bastion of Endeavor Translation

/datum/client_preference/digestion_noises
	/* Bastion of Endeavor Translation
	description = "Digestion Noises"
	key = "DIGEST_NOISES"
	enabled_description = "Noisy"
	disabled_description = "Silent"
	*/
	description = "Звуки переваривания"
	key = "DIGEST_NOISES"
	// End of Bastion of Endeavor Translation

/datum/client_preference/belch_noises // Belching noises - pref toggle for 'em
	/* Bastion of Endeavor Translation
	description = "Burping"
	key = "BELCH_NOISES"
	enabled_description = "Noisy"
	disabled_description = "Silent"
	*/
	description = "Звуки отрыжек"
	key = "BELCH_NOISES"
	enabled_by_default = FALSE //CHOMPedit
	// End of Bastion of Endeavor Translation

/datum/client_preference/emote_noises
	/* Bastion of Endeavor Translation
	description = "Emote Noises" //MERP
	key = "EMOTE_NOISES"
	enabled_description = "Noisy"
	disabled_description = "Silent"
	*/
	description = "Звуковые действия" //MERP
	key = "EMOTE_NOISES"
	// End of Bastion of Endeavor Translation
/datum/client_preference/whisubtle_vis
	/* Bastion of Endeavor Translation
	description = "Whi/Subtles Ghost Visible"
	key = "WHISUBTLE_VIS"
	enabled_description = "Visible"
	disabled_description = "Hidden"
	*/
	description = "Ваши скрытые действия и шёпот"
	key = "WHISUBTLE_VIS"
	enabled_description = "Видны призракам"
	disabled_description = "Скрыты от призраков"
	// End of Bastion of Endeavor Translation
	enabled_by_default = FALSE

/datum/client_preference/ghost_see_whisubtle
	/* Bastion of Endeavor Translation
	description = "See subtles/whispers as ghost"
	key = "GHOST_SEE_WHISUBTLE"
	enabled_description = "Visible"
	disabled_description = "Hidden"
	*/
	description = "Чужие скрытые действия и шёпот"
	key = "GHOST_SEE_WHISUBTLE"
	enabled_description = "Видны вам за призрака"
	disabled_description = "Скрыты от вас за призрака"
	// End of Bastion of Endeavor Translation
	enabled_by_default = TRUE
//VOREStation Add End
/datum/client_preference/weather_sounds
	/* Bastion of Endeavor Translation
	description ="Weather sounds"
	key = "SOUND_WEATHER"
	enabled_description = "Audible"
	disabled_description = "Silent"
	*/
	description ="Звуки погоды"
	key = "SOUND_WEATHER"
	// End of Bastion of Endeavor Translation

/datum/client_preference/supermatter_hum
	/* Bastion of Endeavor Translation
	description ="Supermatter hum"
	key = "SOUND_SUPERMATTER"
	enabled_description = "Audible"
	disabled_description = "Silent"
	*/
	description ="Гул суперматерии"
	key = "SOUND_SUPERMATTER"
	enabled_description = "Включен"
	disabled_description = "Отключен"
	// End of Bastion of Endeavor Translation

/datum/client_preference/ghost_ears
	/* Bastion of Endeavor Translation
	description ="Ghost ears"
	key = "CHAT_GHOSTEARS"
	enabled_description = "All Speech"
	disabled_description = "Nearby"
	*/
	description ="Призрачный слух"
	key = "CHAT_GHOSTEARS"
	enabled_description = "Вся речь"
	disabled_description = "Только поблизости"
	// End of Bastion of Endeavor Translation

/datum/client_preference/ghost_sight
	/* Bastion of Endeavor Translation
	description ="Ghost sight"
	key = "CHAT_GHOSTSIGHT"
	enabled_description = "All Emotes"
	disabled_description = "Nearby"
	*/
	description ="Призрачное зрение"
	key = "CHAT_GHOSTSIGHT"
	enabled_description = "Все действия"
	disabled_description = "Только поблизости"
	// End of Bastion of Endeavor Translation

/datum/client_preference/ghost_radio
	/* Bastion of Endeavor Translation
	description ="Ghost radio"
	key = "CHAT_GHOSTRADIO"
	enabled_description = "All Chatter"
	disabled_description = "Nearby"
	*/
	description ="Призрачная рация"
	key = "CHAT_GHOSTRADIO"
	enabled_description = "Все каналы"
	disabled_description = "Только поблизости"
	// End of Bastion of Endeavor Translation

/datum/client_preference/chat_tags
	/* Bastion of Endeavor Translation
	description ="Chat tags"
	key = "CHAT_SHOWICONS"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Иконки каналов чата"
	key = "CHAT_SHOWICONS"
	// End of Bastion of Endeavor Translation

/datum/client_preference/air_pump_noise
	/* Bastion of Endeavor Translation
	description ="Air Pump Ambient Noise"
	key = "SOUND_AIRPUMP"
	enabled_description = "Audible"
	disabled_description = "Silent"
	*/
	description ="Звуки вентиляции"
	key = "SOUND_AIRPUMP"
	// End of Bastion of Endeavor Translation

/datum/client_preference/looping_alarms // CHOMPStation Add: Looping Alarms
	/* Bastion of Endeavor Translation
	description ="Looping Alarm Sounds"
	key = "SOUND_ALARMLOOP"
	enabled_description = "Audible"
	disabled_description = "Silent"
	*/
	description ="Звуки тревог"
	key = "SOUND_ALARMLOOP"
	// End of Bastion of Endeavor Translation

/datum/client_preference/fridge_hum // CHOMPStation Add: Misc Sounds
	/* Bastion of Endeavor Translation
	description ="Fridge Humming"
	key = "SOUND_FRIDGEHUM"
	enabled_description = "Audible"
	disabled_description = "Silent"
	*/
	description ="Гудение холодильника"
	key = "SOUND_FRIDGEHUM"
	// End of Bastion of Endeavor Translation

/datum/client_preference/old_door_sounds
	/* Bastion of Endeavor Translation
	description ="Old Door Sounds"
	key = "SOUND_OLDDOORS"
	enabled_description = "Old"
	disabled_description = "New"
	*/
	description ="Звуки шлюзов"
	key = "SOUND_OLDDOORS"
	enabled_description = "Старые"
	disabled_description = "Новые"
	enabled_by_default = FALSE
	// End of Bastion of Endeavor Translation

/datum/client_preference/department_door_sounds
	/* Bastion of Endeavor Translation
	description ="Department-Specific Door Sounds"
	key = "SOUND_DEPARTMENTDOORS"
	enabled_description = "Enabled"
	disabled_description = "Disabled"
	*/
	description ="Звуки шлюзов отделов"
	key = "SOUND_DEPARTMENTDOORS"
	enabled_description = "По отделам"
	disabled_description = "Одинаковые"
	// End of Bastion of Endeavor Translation

/datum/client_preference/pickup_sounds
	/* Bastion of Endeavor Translation
	description = "Picked Up Item Sounds"
	key = "SOUND_PICKED"
	enabled_description = "Enabled"
	disabled_description = "Disabled"
	*/
	description = "Звуки при взятии предметов"
	key = "SOUND_PICKED"
	// End of Bastion of Endeavor Translation

/datum/client_preference/drop_sounds
	/* Bastion of Endeavor Translation
	description = "Dropped Item Sounds"
	key = "SOUND_DROPPED"
	enabled_description = "Enabled"
	disabled_description = "Disabled"
	*/
	description = "Звуки при броске предметов"
	key = "SOUND_DROPPED"
	// End of Bastion of Endeavor Translation

/datum/client_preference/mob_tooltips
	/* Bastion of Endeavor Translation
	description ="Mob tooltips"
	key = "MOB_TOOLTIPS"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Всплывающие подсказки существ"
	key = "MOB_TOOLTIPS"
	// End of Bastion of Endeavor Translation

/datum/client_preference/inv_tooltips
	/* Bastion of Endeavor Translation
	description ="Inventory tooltips"
	key = "INV_TOOLTIPS"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Всплывающие подсказки в инвентаре"
	key = "INV_TOOLTIPS"
	// End of Bastion of Endeavor Translation

/datum/client_preference/attack_icons
	/* Bastion of Endeavor Translation
	description ="Attack icons"
	key = "ATTACK_ICONS"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Иконки атак"
	key = "ATTACK_ICONS"
	// End of Bastion of Endeavor Translation

/datum/client_preference/precision_placement
	/* Bastion of Endeavor Translation
	description ="Precision Placement"
	key = "PRECISE_PLACEMENT"
	enabled_description = "Active"
	disabled_description = "Inactive"
	*/
	description ="Точное размещение"
	key = "PRECISE_PLACEMENT"
	enabled_description = "Включено"
	disabled_description = "Отключено"
	// End of Bastion of Endeavor Translation

/datum/client_preference/hotkeys_default
	/* Bastion of Endeavor Translation
	description ="Hotkeys Default"
	key = "HUD_HOTKEYS"
	enabled_description = "Enabled"
	disabled_description = "Disabled"
	*/
	description ="Хоткеи по умолчанию"
	key = "HUD_HOTKEYS"
	// End of Bastion of Endeavor Translation
	enabled_by_default = TRUE // Backwards compatibility //CHOMP Edit: It's 2020, use your WASD keys by default. Flipped to True.

/datum/client_preference/show_typing_indicator
	/* Bastion of Endeavor Translation
	description ="Typing indicator"
	key = "SHOW_TYPING"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Индикатор набора текста"
	key = "SHOW_TYPING"
	enabled_description = "Включен"
	disabled_description = "Отключен"
	enabled_by_default = TRUE // Backwards compatibility //CHOMP Edit: It's 2020, use your WASD keys by default. Flipped to True.
	// End of Bastion of Endeavor Translation

/datum/client_preference/show_typing_indicator/toggled(var/mob/preference_mob, var/enabled)
	if(!enabled)
		preference_mob.client?.stop_thinking()

/datum/client_preference/show_typing_indicator_subtle
	/* Bastion of Endeavor Translation
	description ="Typing indicator (subtle)"
	key = "SHOW_TYPING_SUBTLE"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Индикатор набора (скрытый текст)"
	key = "SHOW_TYPING_SUBTLE"
	enabled_description = "Включен"
	disabled_description = "Отключен"
	// End of Bastion of Endeavor Translation

/datum/client_preference/show_ooc
	/* Bastion of Endeavor Translation
	description ="OOC chat"
	key = "CHAT_OOC"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Чат OOC"
	key = "CHAT_OOC"
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/show_looc
	/* Bastion of Endeavor Translation
	description ="LOOC chat"
	key = "CHAT_LOOC"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Чат LOOC"
	key = "CHAT_LOOC"
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/show_dsay
	/* Bastion of Endeavor Translation
	description ="Dead chat"
	key = "CHAT_DEAD"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Чат мёртвых"
	key = "CHAT_DEAD"
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/check_mention
	/* Bastion of Endeavor Translation
	description ="Emphasize Name Mention"
	key = "CHAT_MENTION"
	enabled_description = "Emphasize"
	disabled_description = "Normal"
	*/
	description ="Выделение упоминаний"
	key = "CHAT_MENTION"
	enabled_description = "Включено"
	disabled_description = "Отключено"
	// End of Bastion of Endeavor Translation

/datum/client_preference/show_progress_bar
	/* Bastion of Endeavor Translation
	description ="Progress Bar"
	key = "SHOW_PROGRESS"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Индикатор выполнения"
	key = "SHOW_PROGRESS"
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/safefiring
	/* Bastion of Endeavor Translation
	description = "Gun Firing Intent Requirement"
	key = "SAFE_FIRING"
	enabled_description = "Safe"
	disabled_description = "Dangerous"
	*/
	description = "Режим огнестрельного оружия"
	key = "SAFE_FIRING"
	enabled_description = "С предохранителем"
	disabled_description = "Без предохранителя"
	// End of Bastion of Endeavor Translation

/datum/client_preference/browser_style
	/* Bastion of Endeavor Translation
	description = "Fake NanoUI Browser Style"
	key = "BROWSER_STYLED"
	enabled_description = "Fancy"
	disabled_description = "Plain"
	*/
	description = "CSS для окон браузера"
	key = "BROWSER_STYLED"
	enabled_description = "Включен"
	disabled_description = "Отключен"
	// End of Bastion of Endeavor Translation

/datum/client_preference/ambient_occlusion
	/* Bastion of Endeavor Translation
	description = "Fake Ambient Occlusion"
	key = "AMBIENT_OCCLUSION_PREF"
	enabled_by_default = FALSE
	enabled_description = "On"
	disabled_description = "Off"
	*/
	description = "Рендеринг Ambient Occlusion"
	key = "AMBIENT_OCCLUSION_PREF"
	enabled_by_default = FALSE
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/ambient_occlusion/toggled(var/mob/preference_mob, var/enabled)
	. = ..()
	if(preference_mob && preference_mob.plane_holder)
		var/datum/plane_holder/PH = preference_mob.plane_holder
		PH.set_ao(VIS_OBJS, enabled)
		PH.set_ao(VIS_MOBS, enabled)

/datum/client_preference/instrument_toggle
	/* Bastion of Endeavor Translation
	description ="Hear In-game Instruments"
	key = "SOUND_INSTRUMENT"
	*/
	description ="Звуки музыкальных инструментов"
	key = "SOUND_INSTRUMENT"
	// End of Bastion of Endeavor Translation

/datum/client_preference/vchat_enable
	/* Bastion of Endeavor Translation
	description = "Enable/Disable TGChat"
	key = "VCHAT_ENABLE"
	enabled_description =  "Enabled"
	disabled_description = "Disabled"
	*/
	description = "TGChat"
	key = "VCHAT_ENABLE"
	enabled_description =  "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/status_indicators
	/* Bastion of Endeavor Translation
	description = "Status Indicators"
	key = "SHOW_STATUS"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description = "Индикаторы состояния"
	key = "SHOW_STATUS"
	// End of Bastion of Endeavor Translation

/datum/client_preference/radio_sounds
	/* Bastion of Endeavor Translation
	description = "Radio Sounds"
	key = "RADIO_SOUNDS"
	enabled_description = "On"
	disabled_description = "Off"
	*/
	description = "Звуки рации"
	key = "RADIO_SOUNDS"
	// End of Bastion of Endeavor Translation

/datum/client_preference/say_sounds
	/* Bastion of Endeavor Translation
	description = "Say Sounds"
	key = "SAY_SOUNDS"
	enabled_description = "On"
	disabled_description = "Off"
	*/
	description = "Голоса при речи"
	key = "SAY_SOUNDS"
	// End of Bastion of Endeavor Translation

/datum/client_preference/emote_sounds
	/* Bastion of Endeavor Translation
	description = "Me Sounds"
	key = "EMOTE_SOUNDS"
	enabled_description = "On"
	disabled_description = "Off"
	*/
	description = "Голоса при действиях"
	key = "EMOTE_SOUNDS"
	// End of Bastion of Endeavor Translation

/datum/client_preference/whisper_sounds
	/* Bastion of Endeavor Translation
	description = "Whisper Sounds"
	key = "WHISPER_SOUNDS"
	enabled_description = "On"
	disabled_description = "Off"
	*/
	description = "Голоса при шёпоте"
	key = "WHISPER_SOUNDS"
	// End of Bastion of Endeavor Translation

/datum/client_preference/subtle_sounds
	/* Bastion of Endeavor Translation
	description = "Subtle Sounds"
	key = "SUBTLE_SOUNDS"
	enabled_description = "On"
	disabled_description = "Off"
	*/
	description = "Голоса при скрытых действиях"
	key = "SUBTLE_SOUNDS"
	// End of Bastion of Endeavor Translation


/* Bastion of Endeavor Translation
/datum/client_preference/vore_health_bars
	description = "Vore Health Bars"
	key = "VORE_HEALTH_BARS"
	enabled_description = "Enabled"
	disabled_description = "Disabled"
*/
/datum/client_preference/vore_health_bars
	description = "Шкалы здоровья при Vore"
	key = "VORE_HEALTH_BARS"
	enabled_description = "Включены"
	disabled_description = "Отключены"
// End of Bastion of Endeavor Translation

/datum/client_preference/runechat_mob
	/* Bastion of Endeavor Translation
	description = "Runechat (Mobs)"
	key = "RUNECHAT_MOB"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description = "Runechat для существ"
	key = "RUNECHAT_MOB"
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/runechat_obj
	/* Bastion of Endeavor Translation
	description = "Runechat (Objs)"
	key = "RUNECHAT_OBJ"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description = "Runechat для объектов"
	key = "RUNECHAT_OBJ"
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/runechat_border
	/* Bastion of Endeavor Translation
	description = "Runechat Message Border"
	key = "RUNECHAT_BORDER"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description = "Контур сообщений Runechat"
	key = "RUNECHAT_BORDER"
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation
	enabled_by_default = TRUE

/datum/client_preference/runechat_long_messages
	/* Bastion of Endeavor Translation
	description = "Runechat Message Length"
	key = "RUNECHAT_LONG"
	enabled_description = "Long"
	disabled_description = "Short"
	*/
	description = "Сообщения Runechat"
	key = "RUNECHAT_LONG"
	enabled_description = "Длинные"
	disabled_description = "Короткие"
	// End of Bastion of Endeavor Translation
	enabled_by_default = FALSE

/datum/client_preference/status_indicators/toggled(mob/preference_mob, enabled)
	. = ..()
	if(preference_mob && preference_mob.plane_holder)
		var/datum/plane_holder/PH = preference_mob.plane_holder
		PH.set_vis(VIS_STATUS, enabled)

/datum/client_preference/show_lore_news
	/* Bastion of Endeavor Translation
	description = "Lore News Popup"
	key = "NEWS_POPUP"
	enabled_by_default = TRUE
	enabled_description = "Popup New On Login"
	disabled_description = "Do Nothing"
	*/
	description = "Уведомления при изменении лора"
	key = "NEWS_POPUP"
	enabled_by_default = TRUE
	enabled_description = "При подключении"
	disabled_description = "Не отображать"
	// End of Bastion of Endeavor Translation

/datum/client_preference/play_mentorhelp_ping
	/* Bastion of Endeavor Translation
	description = "Mentorhelps"
	key = "SOUND_MENTORHELP"
	enabled_description = "Hear"
	disabled_description = "Silent"
	*/
	description = "Звук помощи ментора"
	key = "SOUND_MENTORHELP"
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/player_tips
	/* Bastion of Endeavor Translation
	description = "Receive Tips Periodically"
	key = "RECEIVE_TIPS"
	enabled_description = "Enabled"
	disabled_description = "Disabled"
	*/
	description = "Периодические подсказки"
	key = "RECEIVE_TIPS"
	// End of Bastion of Endeavor Translation

/datum/client_preference/pain_frequency
	/* Bastion of Endeavor Translation
	description = "Pain Messages Cooldown"
	key = "PAIN_FREQUENCY"
	enabled_by_default = FALSE
	enabled_description = "Extended"
	disabled_description = "Default"
	*/
	description = "Таймер болевых сообщений"
	key = "PAIN_FREQUENCY"
	enabled_by_default = FALSE
	enabled_description = "Длинный"
	disabled_description = "По умолчанию"
	// End of Bastion of Endeavor Translation

// CHOMPAdd
/datum/client_preference/sleep_music
	/* Bastion of Endeavor Translation
	description = "Sleeping Music"
	key = "SLEEP_MUSIC"
	enabled_description = "Audible"
	disabled_description = "Silent"
	*/
	description = "Музыка при сне"
	key = "SLEEP_MUSIC"
	enabled_description = "Включена"
	disabled_description = "Отключена"
	// End of Bastion of Endeavor Translation
// CHOMPAdd End

/datum/client_preference/auto_afk
	/* Bastion of Endeavor Translation
	description = "Automatic AFK Status"
	key = "AUTO_AFK"
	enabled_by_default = TRUE
	enabled_description = "Automatic"
	disabled_description = "Manual Only"
	*/
	description = "Статус AFK при бездействии"
	key = "AUTO_AFK"
	enabled_by_default = TRUE
	enabled_description = "Автоматический"
	disabled_description = "Только ручной"
	// End of Bastion of Endeavor Translation

/datum/client_preference/tgui_say
	/* Bastion of Endeavor Translation
	description = "TGUI Say: Use TGUI For Say Input"
	key = "TGUI_SAY"
	enabled_by_default = TRUE
	enabled_description = "Yes"
	disabled_description = "No"
	*/
	description = "Окно речи TGUI"
	key = "TGUI_SAY"
	enabled_by_default = TRUE
	enabled_description = "Включено"
	disabled_description = "Отключено"
	// End of Bastion of Endeavor Translation

/datum/client_preference/tgui_say_light
	/* Bastion of Endeavor Translation
	description = "TGUI Say: Use Light Mode"
	key = "TGUI_SAY_LIGHT_MODE"
	enabled_by_default = FALSE
	enabled_description = "Yes"
	disabled_description = "No"
	*/
	description = "Тема окна речи TGUI"
	key = "TGUI_SAY_LIGHT_MODE"
	enabled_by_default = FALSE
	enabled_description = "Светлая"
	disabled_description = "Темная"
	// End of Bastion of Endeavor Translation

/********************
* Staff Preferences *
********************/
/datum/client_preference/admin/may_toggle(var/mob/preference_mob)
	return check_rights(R_ADMIN|R_EVENT, 0, preference_mob)

/datum/client_preference/mod/may_toggle(var/mob/preference_mob)
	return check_rights(R_MOD|R_ADMIN, 0, preference_mob)

/datum/client_preference/debug/may_toggle(var/mob/preference_mob)
	return check_rights(R_DEBUG|R_ADMIN, 0, preference_mob)

/datum/client_preference/mod/show_attack_logs
	/* Bastion of Endeavor Translation
	description = "Attack Log Messages"
	key = "CHAT_ATTACKLOGS"
	enabled_description = "Show"
	disabled_description = "Hide"
	enabled_by_default = FALSE
	*/
	description = "Лог атак"
	key = "CHAT_ATTACKLOGS"
	enabled_description = "Показывать"
	disabled_description = "Не показывать"
	enabled_by_default = FALSE
	// End of Bastion of Endeavor Translation

/datum/client_preference/debug/show_debug_logs
	/* Bastion of Endeavor Translation
	description = "Debug Log Messages"
	key = "CHAT_DEBUGLOGS"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description = "Лог отладки"
	key = "CHAT_DEBUGLOGS"
	enabled_description = "Показывать"
	disabled_description = "Не показывать"
	// End of Bastion of Endeavor Translation
	enabled_by_default = FALSE

/datum/client_preference/admin/show_chat_prayers
	/* Bastion of Endeavor Translation
	description = "Chat Prayers"
	key = "CHAT_PRAYER"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description = "Молитвы в чате"
	key = "CHAT_PRAYER"
	enabled_description = "Показывать"
	disabled_description = "Не показывать"
	// End of Bastion of Endeavor Translation

/datum/client_preference/holder/may_toggle(var/mob/preference_mob)
	return preference_mob && preference_mob.client && preference_mob.client.holder

/datum/client_preference/holder/play_adminhelp_ping
	/* Bastion of Endeavor Translation
	description = "Adminhelps"
	key = "SOUND_ADMINHELP"
	enabled_description = "Hear"
	disabled_description = "Silent"
	*/
	description = "Звук Помощи администратора (Админ)"
	key = "SOUND_ADMINHELP"
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/holder/hear_radio
	/* Bastion of Endeavor Translation
	description = "Radio chatter"
	key = "CHAT_RADIO"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description = "Слышать рацию (Админ)"
	key = "CHAT_RADIO"
	enabled_description = "Да"
	disabled_description = "Нет"
	// End of Bastion of Endeavor Translation

/datum/client_preference/holder/show_rlooc
	/* Bastion of Endeavor Translation
	description ="Remote LOOC chat"
	key = "CHAT_RLOOC"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description ="Глобальный LOOC (Админ)"
	key = "CHAT_RLOOC"
	enabled_description = "Включён"
	disabled_description = "Отключён"
	// End of Bastion of Endeavor Translation

/datum/client_preference/holder/show_staff_dsay
	/* Bastion of Endeavor Translation
	description ="Staff Deadchat"
	key = "CHAT_ADSAY"
	enabled_description = "Show"
	disabled_description = "Hide"
	*/
	description = "Чат мёртвых в игре (Админ)"
	key = "CHAT_ADSAY"
	enabled_description = "Показывать"
	disabled_description = "Скрывать"
	// End of Bastion of Endeavor Translation
