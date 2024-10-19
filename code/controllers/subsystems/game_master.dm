// This is a sort of successor to the various event systems created over the years.  It is designed to be just a tad smarter than the
// previous ones, checking various things like player count, department size and composition, individual player activity,
// individual player (IC) skill, and such, in order to try to choose the best events to take in order to add spice or variety to
// the round.

// This subsystem holds the logic that chooses events. Actual event processing is handled in a seperate subsystem.
SUBSYSTEM_DEF(game_master)
	/* Bastion of Endeavor Translation
	name = "Events (Game Master)"
	*/
	name = "События (Игровой мастер)"
	// End of Bastion of Endeavor Translation
	wait = 1 MINUTE
	runlevels = RUNLEVEL_GAME

	// The GM object is what actually chooses events.
	// It's held in a seperate object for better encapsulation, and allows for different 'flavors' of GMs to be made, that choose events differently.
	var/datum/game_master/GM = null
	var/game_master_type = /datum/game_master/default

	var/list/available_events = list() // A list of meta event objects.

	var/danger = 0						// The GM's best guess at how chaotic the round is.  High danger makes it hold back.
	var/staleness = -20					// Determines liklihood of the GM doing something, increases over time.

	var/next_event = 0								// Minimum amount of time of nothingness until the GM can pick something again.

	var/debug_messages = FALSE // If true, debug information is written to `log_debug()`.

/datum/controller/subsystem/game_master/Initialize()
	var/list/subtypes = subtypesof(/datum/event2/meta)
	for(var/T in subtypes)
		var/datum/event2/meta/M = new T()
		if(!M.name)
			continue
		available_events += M

	GM = new game_master_type()

	if(config && !CONFIG_GET(flag/enable_game_master)) // CHOMPEdit
		can_fire = FALSE

	return SS_INIT_SUCCESS // CHOMPEdit

/datum/controller/subsystem/game_master/fire(resumed)
	adjust_staleness(1)
	adjust_danger(-1)

	var/global_afk = metric.assess_all_living_mobs()
	global_afk = abs(global_afk - 100)
	global_afk = round(global_afk / 100, 0.1)
	adjust_staleness(global_afk) // Staleness increases faster if more people are less active.

	if(GM.ignore_time_restrictions || next_event < world.time)
		if(prob(staleness) && pre_event_checks())
			do_event_decision()
	if(REALTIMEOFDAY >= 386000 && REALTIMEOFDAY < 387000) //CHOMPEdit
		/* Bastion of Endeavor Translation: Doesn't actually concern us whatsoever but sure
		to_world("<b>Automated router restart warning! Connection will be temporarily lost in a moment. Recommended to save any unfinished posts and avoid time-sensitive situations until router is back online.</b>") //CHOMPEdit
		*/
		to_world("<b>Внимание: автоматический рестарт роутера! Соединение будет ненадолго потеряно. Рекомендуется сохранить недописанные посты и избегать действий, зависящих от времени, до восстановления работы роутера.</b>")
		// End of Bastion of Endeavor Translation


/datum/controller/subsystem/game_master/proc/do_event_decision()
	/* Bastion of Endeavor Translation
	log_game_master("Going to choose an event.")
	*/
	log_game_master("Сейчас будет выбрано событие.")
	// End of Bastion of Endeavor Translation
	var/datum/event2/meta/event_picked = GM.choose_event()
	if(event_picked)
		run_event(event_picked)
		next_event = world.time + rand(GM.decision_cooldown_lower_bound, GM.decision_cooldown_upper_bound)

/datum/controller/subsystem/game_master/proc/debug_gm()
	can_fire = TRUE
	staleness = 100
	debug_messages = TRUE

/datum/controller/subsystem/game_master/proc/run_event(datum/event2/meta/chosen_event)
	var/datum/event2/event/E = chosen_event.make_event()

	chosen_event.times_ran++

	if(!chosen_event.reusable)
		// Disable this event, so it only gets picked once.
		chosen_event.enabled = FALSE
		if(chosen_event.event_class)
			// Disable similar events, too.
			for(var/datum/event2/meta/meta as anything in available_events)
				if(meta.event_class == chosen_event.event_class)
					meta.enabled = FALSE

	SSevent_ticker.event_started(E)
	adjust_danger(chosen_event.chaos)
	adjust_staleness(-(10 + chosen_event.chaos)) // More chaotic events reduce staleness more, e.g. a 25 chaos event will reduce it by 35.


// Tell the game master that something dangerous happened, e.g. someone dying, station explosions.
/datum/controller/subsystem/game_master/proc/adjust_danger(amount)
	amount *= GM.danger_modifier
	danger = round(between(0, danger + amount, 1000), 0.1)

// Tell the game master that things are getting boring if positive, or something interesting if negative..
/datum/controller/subsystem/game_master/proc/adjust_staleness(amount)
	amount *= GM.staleness_modifier
	staleness = round( between(-20, staleness + amount, 100), 0.1)

// These are ran before committing to an event.
// Returns TRUE if the system is allowed to procede, otherwise returns FALSE.
/datum/controller/subsystem/game_master/proc/pre_event_checks(quiet = FALSE)
	if(!ticker || ticker.current_state != GAME_STATE_PLAYING)
		if(!quiet)
			/* Bastion of Endeavor Translation
			log_game_master("Unable to start event: Ticker is nonexistent, or the game is not ongoing.")
			*/
			log_game_master("Не удалось начать событие: отсутствует тикер, либо игра ещё не идет.")
			// End of Bastion of Endeavor Translation
		return FALSE
	if(GM.ignore_time_restrictions)
		return TRUE
	if(next_event > world.time) // Sanity.
		if(!quiet)
			/* Bastion of Endeavor Translation
			log_game_master("Unable to start event: Time until next event is approximately [round((next_event - world.time) / (1 MINUTE))] minute(s)")
			*/
			log_game_master("Не удалось начать событие: время до следующего события приблизительно [count_ru(round((next_event - world.time) / (1 MINUTE)), "минут;а;ы;")].")
			// End of Bastion of Endeavor Translation
		return FALSE

	// Last minute antagging is bad for humans to do, so the GM will respect the start and end of the round.
	var/mills = round_duration_in_ds
	var/mins = round((mills % 36000) / 600)
	var/hours = round(mills / 36000)

//	if(hours < 1 && mins <= 20) // Don't do anything for the first twenty minutes of the round.
//		if(!quiet)
//			log_debug("Game Master unable to start event: It is too early.")
//		return FALSE
	if(hours >= 2 && mins >= 40) // Don't do anything in the last twenty minutes of the round, as well.
		if(!quiet)
			/* Bastion of Endeavor Translation
			log_game_master("Unable to start event: It is too late.")
			*/
			log_game_master("Не удалось начать событие: слишком поздно.")
			// End of Bastion of Endeavor Translation
		return FALSE
	return TRUE

/datum/controller/subsystem/game_master/proc/choose_game_master(mob/user)
	var/list/subtypes = subtypesof(/datum/game_master)
	/* Bastion of Endeavor Translation
	var/new_gm_path = tgui_input_list(user, "What kind of Game Master do you want?", "New Game Master", subtypes)
	*/
	var/new_gm_path = tgui_input_list(user, "Укажите желаемый тип Игрового мастера.", "Новый Игровой мастер", subtypes)
	// End of Bastion of Endeavor Translation
	if(new_gm_path)
		/* Bastion of Endeavor Translation
		log_and_message_admins("has swapped the current GM ([GM.type]) for a new GM ([new_gm_path]).")
		*/
		log_and_message_admins("сменил текущий ИМ ([GM.type]) на новый ИМ ([new_gm_path]).")
		// End of Bastion of Endeavor Translation
		GM = new new_gm_path(src)

/datum/controller/subsystem/game_master/proc/log_game_master(message)
	if(debug_messages)
		/* Bastion of Endeavor Translation
		log_debug("GAME MASTER: [message]")
		*/
		log_debug("ИГРОВОЙ МАСТЕР: [message]")
		// End of Bastion of Endeavor Translation


// This object makes the actual decisions.
/datum/game_master
	// Multiplier for how much 'danger' is accumulated. Higer generally makes it possible for more dangerous events to be picked.
	var/danger_modifier = 1.0

	// Ditto.  Higher numbers generally result in more events occuring in a round.
	var/staleness_modifier = 1.0

	var/decision_cooldown_lower_bound = 5 MINUTES	// Lower bound for how long to wait until -the potential- for another event being decided.
	var/decision_cooldown_upper_bound = 20 MINUTES	// Same, but upper bound.

	var/ignore_time_restrictions = FALSE 	// Useful for debugging without needing to wait 20 minutes each time.
	var/ignore_round_chaos = FALSE			// If true, the system will happily choose back to back intense events like meteors and blobs, Dwarf Fortress style.

/client/proc/show_gm_status()
	/* Bastion of Endeavor Translation
	set category = "Debug"
	set name = "Show GM Status"
	set desc = "Shows you what the GM is thinking.  If only that existed in real life..."
	*/
	set category = "Отладка"
	set name = "Показать Статус ИМ"
	set desc = "Показать, о чём думает Игровой мастер. Вот бы в жизни такое..."
	// End of Bastion of Endeavor Translation

	if(check_rights(R_ADMIN|R_EVENT|R_DEBUG))
		SSgame_master.interact(usr)
	else
		/* Bastion of Endeavor Translation
		to_chat(usr, span_warning("You do not have sufficient rights to view the GM panel, sorry."))
		*/
		to_chat(usr, span_warning("К сожалению, у вас недостаточно прав для просмотра панели Игрового мастера."))
		// End of Bastion of Endeavor Translation

/datum/controller/subsystem/game_master/proc/interact(var/client/user)
	if(!user)
		return

	// Using lists for string tree conservation.
	/* Bastion of Endeavor Translation
	var/list/dat = list("<html><head><title>Automated Game Master Event System</title></head><body>")
	*/
	var/list/dat = list("<html><head><title>Система Игрового мастера событий</title></head><body>")
	// End of Bastion of Endeavor Translation

	// Makes the system turn on or off.
	/* Bastion of Endeavor Translation
	dat += href(src, list("toggle" = 1), "\[Toggle GM\]")
	*/
	dat += href(src, list("toggle" = 1), "\[Переключить ИМ\]")
	// End of Bastion of Endeavor Translation
	dat += " | "

	// Makes the system not care about staleness or being near round-end.
	/* Bastion of Endeavor Translation
	dat += href(src, list("toggle_time_restrictions" = 1), "\[Toggle Time Restrictions\]")
	*/
	dat += href(src, list("toggle_time_restrictions" = 1), "\[Переключить ограничение по времени\]")
	// End of Bastion of Endeavor Translation
	dat += " | "

	// Makes the system not care about how chaotic the round might be.
	/* Bastion of Endeavor Translation
	dat += href(src, list("toggle_chaos_throttle" = 1), "\[Toggle Chaos Throttling\]")
	*/
	dat += href(src, list("toggle_chaos_throttle" = 1), "\[Переключить ограничение на хаос\]")
	// End of Bastion of Endeavor Translation
	dat += " | "

	// Makes the system immediately choose an event, while still bound to factors like danger, weights, and department staffing.
	/* Bastion of Endeavor Translation
	dat += href(src, list("force_choose_event" = 1), "\[Force Event Decision\]")
	*/
	dat += href(src, list("force_choose_event" = 1), "\[Принудительный выбор события\]")
	// End of Bastion of Endeavor Translation
	dat += "<br>"

	// Swaps out the current GM for a new one with different ideas on what a good event might be.
	/* Bastion of Endeavor Translation
	dat += href(src, list("change_gm" = 1), "\[Change GM\]")
	*/
	dat += href(src, list("change_gm" = 1), "\[Изменить Игровой мастер\]")
	// End of Bastion of Endeavor Translation
	dat += "<br>"

	/* Bastion of Endeavor Translation
	dat += "Current GM Type: [GM.type]<br>"
	dat += "State: [can_fire ? "Active": "Inactive"]<br>"
	dat += "Status: [pre_event_checks(TRUE) ? "Ready" : "Suppressed"]<br><br>"
	*/
	dat += "Текущий тип ИМ: [GM.type]<br>"
	dat += "Состояние: [can_fire ? "Активный": "Неактивный"]<br>"
	dat += "Статус: [pre_event_checks(TRUE) ? "Готов" : "Подавлен"]<br><br>"
	// End of Bastion of Endeavor Translation

	/* Bastion of Endeavor Translation
	dat += "Staleness: [staleness] "
	dat += href(src, list("set_staleness" = 1), "\[Set\]")
	dat += "<br>"
	dat += "<i>Staleness is an estimate of how boring the round might be, and if an event should be done. It is increased passively over time, \
	and increases faster if people are AFK. It deceases when events and certain 'interesting' things happen in the round.</i><br>"
	*/
	dat += "Скука: [staleness] "
	dat += href(src, list("set_staleness" = 1), "\[Установить\]")
	dat += "<br>"
	dat += "<i>Показатель скуки отражает, насколько застоялым может быть раунд, и стоит ли проводить событие. Он увеличивается со временем, особенно когда люди стоят в АФК. \
	Он уменьшается, когда происходят события и другие 'интересные' вещи.</i><br>"
	// End of Bastion of Endeavor Translation

	/* Bastion of Endeavor Translation
	dat += "Danger: [danger] "
	dat += href(src, list("set_danger" = 1), "\[Set\]")
	dat += "<br>"
	dat += "<i>Danger is an estimate of how chaotic the round has been so far. It is decreased passively over time, and is increased by having \
	certain chaotic events be selected, or chaotic things happen in the round. A sufficently high amount of danger will make the system \
	avoid using destructive events, to avoid pushing the station over the edge.</i><br>"
	*/
	dat += "Опасность: [danger] "
	dat += href(src, list("set_danger" = 1), "\[Установить\]")
	dat += "<br>"
	dat += "<i>Опасность отражает, насколько раунд был до этого момента хаотичным. Она уменьшается со временем, и увеличивается, когда \
	выбираются хаотичные события или происходят хаотичные вещи. Чрезмерно высокое значение принудит систему избегать деструктивных события, дабы слишком сильно не душить станцию.</i><br>"
	// End of Bastion of Endeavor Translation

	/* Bastion of Endeavor Translation
	dat += "<h2>Player Activity:</h2>"
	*/
	dat += "<h2>Игровая активность:</h2>"
	// End of Bastion of Endeavor Translation

	dat += "<table border='1' style='width:100%'>"
	dat += "<tr>"
	/* Bastion of Endeavor Translation
	dat += "<th>Category</th>"
	dat += "<th>Activity Percentage</th>"
	*/
	dat += "<th>Категория</th>"
	dat += "<th>Процент активности</th>"
	// End of Bastion of Endeavor Translation
	dat += "</tr>"

	dat += "<tr>"
	/* Bastion of Endeavor Translation
	dat += "<td>All Living Mobs</td>"
	*/
	dat += "<td>Живые существа</td>"
	// End of Bastion of Endeavor Translation
	dat += "<td>[metric.assess_all_living_mobs()]%</td>"
	dat += "</tr>"

	dat += "<tr>"
	/* Bastion of Endeavor Translation
	dat += "<td>All Ghosts</td>"
	*/
	dat += "<td>Все призраки</td>"
	// End of Bastion of Endeavor Translation
	dat += "<td>[metric.assess_all_dead_mobs()]%</td>"
	dat += "</tr>"

	dat += "<tr>"
	/* Bastion of Endeavor Translation
	dat += "<th colspan='2'>Departments</td>"
	*/
	dat += "<th colspan='2'>Отделы</td>"
	// End of Bastion of Endeavor Translation
	dat += "</tr>"

	for(var/D in metric.departments)
		dat += "<tr>"
		dat += "<td>[D]</td>"
		dat += "<td>[metric.assess_department(D)]%</td>"
		dat += "</tr>"

	dat += "<tr>"
	/* Bastion of Endeavor Translation
	dat += "<th colspan='2'>Players</td>"
	*/
	dat += "<th colspan='2'>Игроки</td>"
	// End of Bastion of Endeavor Translation
	dat += "</tr>"

	for(var/mob/M as anything in player_list)
		dat += "<tr>"
		dat += "<td>[M] ([M.ckey])</td>"
		dat += "<td>[metric.assess_player_activity(M)]%</td>"
		dat += "</tr>"
	dat += "</table>"

	/* Bastion of Endeavor Translation
	dat += "<h2>Events available:</h2>"
	*/
	dat += "<h2>Доступные события:</h2>"
	// End of Bastion of Endeavor Translation

	/* Bastion of Endeavor Translation
	dat += "<table border='1' style='width:100%'>"
	dat += "<tr>"
	dat += "<th>Event Name</th>"
	dat += "<th>Involved Departments</th>"
	dat += "<th>Chaos</th>"
	dat += "<th>Chaotic Threshold</th>"
	dat += "<th>Weight</th>"
	dat += "<th>Buttons</th>"
	dat += "</tr>"
	*/
	dat += "<table border='1' style='width:100%'>"
	dat += "<tr>"
	dat += "<th>Название события</th>"
	dat += "<th>Участвующие отделы</th>"
	dat += "<th>Хаос</th>"
	dat += "<th>Черта хаоса</th>"
	dat += "<th>Вес</th>"
	dat += "<th>Кнопочки</th>"
	dat += "</tr>"
	// End of Bastion of Endeavor Translation

	for(var/datum/event2/meta/event as anything in available_events)
		dat += "<tr>"
		if(!event.enabled)
			dat += "<td><strike>[event.name]</strike></td>"
		else
			dat += "<td>[event.name]</td>"
		dat += "<td>[english_list(event.departments)]</td>"
		dat += "<td>[event.chaos]</td>"
		dat += "<td>[event.chaotic_threshold]</td>"
		dat += "<td>[event.get_weight()]</td>"
		/* Bastion of Endeavor Translation
		dat += "<td>[href(event, list("force" = 1), "\[Force\]")] [href(event, list("toggle" = 1), "\[Toggle\]")]</td>"
		*/
		dat += "<td>[href(event, list("force" = 1), "\[Принудить\]")] [href(event, list("toggle" = 1), "\[Переключить\]")]</td>"
		// End of Bastion of Endeavor Translation
		dat += "</tr>"
	dat += "</table>"

	/* Bastion of Endeavor Translation
	dat += "<h2>Events active:</h2>"
	*/
	dat += "<h2>Активные события:</h2>"
	// End of Bastion of Endeavor Translation

	/* Bastion of Endeavor Translation
	dat += "Current time: [world.time]"
	*/
	dat += "Текущее время: [world.time]"
	// End of Bastion of Endeavor Translation
	dat += "<table border='1' style='width:100%'>"
	dat += "<tr>"
	/* Bastion of Endeavor Translation
	dat += "<th>Event Type</th>"
	dat += "<th>Time Started</th>"
	dat += "<th>Time to Announce</th>"
	dat += "<th>Time to End</th>"
	dat += "<th>Announced</th>"
	dat += "<th>Started</th>"
	dat += "<th>Ended</th>"
	dat += "<th>Buttons</th>"
	*/
	dat += "<th>Тип события</th>"
	dat += "<th>Время начала</th>"
	dat += "<th>Время до объявления</th>"
	dat += "<th>Время до окончания</th>"
	dat += "<th>Объявлено</th>"
	dat += "<th>Начато</th>"
	dat += "<th>Завершено</th>"
	dat += "<th>Кнопочки</th>"
	// End of Bastion of Endeavor Translation
	dat += "</tr>"

	for(var/datum/event2/event/event as anything in SSevent_ticker.active_events)
		dat += "<tr>"
		dat += "<td>[event.type]</td>"
		dat += "<td>[event.time_started]</td>"
		/* Bastion of Endeavor Translation
		dat += "<td>[event.time_to_announce ? event.time_to_announce : "NULL"]</td>"
		dat += "<td>[event.time_to_end ? event.time_to_end : "NULL"]</td>"
		dat += "<td>[event.announced ? "Yes" : "No"]</td>"
		dat += "<td>[event.started ? "Yes" : "No"]</td>"
		dat += "<td>[event.ended ? "Yes" : "No"]</td>"
		dat += "<td>[href(event, list("abort" = 1), "\[Abort\]")]</td>"
		*/
		dat += "<td>[event.time_to_announce ? event.time_to_announce : "НЕТ"]</td>"
		dat += "<td>[event.time_to_end ? event.time_to_end : "НЕТ"]</td>"
		dat += "<td>[event.announced ? "Да" : "Нет"]</td>"
		dat += "<td>[event.started ? "Да" : "Нет"]</td>"
		dat += "<td>[event.ended ? "Да" : "Нет"]</td>"
		dat += "<td>[href(event, list("abort" = 1), "\[Отмена\]")]</td>"
		// End of Bastion of Endeavor Translation
		dat += "</tr>"
	dat += "</table>"
	dat += "</body></html>"

	/* Bastion of Endeavor Translation
	dat += "<h2>Events completed:</h2>"
	*/
	dat += "<h2>Завершённые события:</h2>"
	// End of Bastion of Endeavor Translation

	dat += "<table border='1' style='width:100%'>"
	dat += "<tr>"
	/* Bastion of Endeavor Translation
	dat += "<th>Event Type</th>"
	dat += "<th>Start Time</th>"
	dat += "<th>Finish Time</th>"
	*/
	dat += "<th>Тип события</th>"
	dat += "<th>Время начала</th>"
	dat += "<th>Время завершения</th>"
	// End of Bastion of Endeavor Translation
	dat += "</tr>"

	for(var/datum/event2/event/event as anything in SSevent_ticker.finished_events)
		dat += "<tr>"
		dat += "<td>[event.type]</td>"
		dat += "<td>[event.time_started]</td>"
		dat += "<td>[event.time_finished]</td>"
		dat += "</tr>"

	dat += "</body></html>"

	/* Bastion of Endeavor Translation
	var/datum/browser/popup = new(user, "game_master_debug", "Automated Game Master Event System", 800, 500, src)
	*/
	var/datum/browser/popup = new(user, "game_master_debug", "Автоматическая система Игрового мастера событий", 800, 500, src)
	// End of Bastion of Endeavor Translation
	popup.set_content(dat.Join())
	popup.open()


/datum/controller/subsystem/game_master/Topic(href, href_list)
	if(..())
		return

	if(href_list["close"]) // Needed or the window re-opens after closing, making it last forever.
		return

	if(!check_rights(R_ADMIN|R_EVENT|R_DEBUG))
		/* Bastion of Endeavor Translation
		message_admins("[usr] has attempted to modify the Game Master values without sufficent privilages.")
		*/
		message_admins("[usr] попытался изменить значения в Игровом мастере без необходимых прав.")
		// End of Bastion of Endeavor Translation
		return

	if(href_list["toggle"])
		can_fire = !can_fire
		/* Bastion of Endeavor Translation
		message_admins("GM was [!can_fire ? "dis" : "en"]abled by [usr.key].")
		*/
		message_admins("[usr.key] [!can_fire ? "от" : "в"]ключил Игровой мастер.")
		// End of Bastion of Endeavor Translation

	if(href_list["toggle_time_restrictions"])
		GM.ignore_time_restrictions = !GM.ignore_time_restrictions
		/* Bastion of Endeavor Translation
		message_admins("GM event time restrictions was [GM.ignore_time_restrictions ? "dis" : "en"]abled by [usr.key].")
		*/
		message_admins("[usr.key] [GM.ignore_time_restrictions ? "от" : "в"]ключил ограничения по времени для Игрового мастера.")
		// End of Bastion of Endeavor Translation

	if(href_list["toggle_chaos_throttle"])
		GM.ignore_round_chaos = !GM.ignore_round_chaos
		/* Bastion of Endeavor Translation
		message_admins("GM event chaos restrictions was [GM.ignore_round_chaos ? "dis" : "en"]abled by [usr.key].")
		*/
		message_admins("[usr.key] [GM.ignore_round_chaos ? "от" : "в"]ключил ограничения по хаосу для Игрового мастера.")
		// End of Bastion of Endeavor Translation

	if(href_list["force_choose_event"])
		do_event_decision()
		/* Bastion of Endeavor Translation
		message_admins("[usr.key] forced the Game Master to choose an event immediately.")
		*/
		message_admins("[usr.key] принудил Игровой мастер сейчас же выбрать событие.")
		// End of Bastion of Endeavor Translation

	if(href_list["change_gm"])
		choose_game_master(usr)

	if(href_list["set_staleness"])
		/* Bastion of Endeavor Translation
		var/amount = tgui_input_number(usr, "How much staleness should there be?", "Game Master")
		*/
		var/amount = tgui_input_number(usr, "Каков должен быть показатель скуки?", "Игровой мастер")
		// End of Bastion of Endeavor Translation
		if(!isnull(amount))
			staleness = amount
			/* Bastion of Endeavor Translation
			message_admins("GM staleness was set to [amount] by [usr.key].")
			*/
			message_admins("[usr.key] установил показатель скуки Игрового мастера на [amount].")
			// End of Bastion of Endeavor Translation

	if(href_list["set_danger"])
		/* Bastion of Endeavor Translation
		var/amount = tgui_input_number(usr, "How much danger should there be?", "Game Master")
		*/
		var/amount = tgui_input_number(usr, "Каков должен быть показатель опасности?", "Игровой мастер")
		// End of Bastion of Endeavor Translation
		if(!isnull(amount))
			danger = amount
			/* Bastion of Endeavor Translation
			message_admins("GM danger was set to [amount] by [usr.key].")
			*/
			message_admins("Пользователь [usr.key] установил показатель опасности Игрового мастера на [amount].")
			// End of Bastion of Endeavor Translation

	interact(usr) // To refresh the UI.
