SUBSYSTEM_DEF(media_tracks)
	/* Bastion of Endeavor Translation
	name = "Media Tracks"
	*/
	name = "Музыкальные треки"
	// End of Bastion of Endeavor Translation
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_MEDIA_TRACKS

	/// Every track, including secret
	var/list/all_tracks = list()
	/// Non-secret jukebox tracks
	var/list/jukebox_tracks = list()
	/// Lobby music tracks
	var/list/lobby_tracks = list()
	/// CHOMPstation edit start: Jack - Injecting casino track into new jukebox subsystem
	var/list/casino_tracks = list()
	/// CHOMPstation edit end

/datum/controller/subsystem/media_tracks/Initialize() // CHOMPEdit
	load_tracks()
	sort_tracks()
	return SS_INIT_SUCCESS // CHOMPEdit

/datum/controller/subsystem/media_tracks/proc/load_tracks()
	for(var/filename in CONFIG_GET(str_list/jukebox_track_files)) // CHOMPEdit
		/* Bastion of Endeavor Translation
		report_progress("Loading jukebox track: [filename]")
		*/
		report_progress("Загрузка трека проигрывателя: [filename].")
		// End of Bastion of Endeavor Translation

		if(!fexists(filename))
			/* Bastion of Endeavor Translation
			error("File not found: [filename]")
			*/
			error("Файл не найден: [filename].")
			// End of Bastion of Endeavor Translation
			continue

		var/list/jsonData = json_decode(file2text(filename))

		if(!istype(jsonData))
			/* Bastion of Endeavor Translation
			error("Failed to read tracks from [filename], json_decode failed.")
			*/
			error("Не удалось прочесть треки в [filename], не удался json_decode.")
			// End of Bastion of Endeavor Translation
			continue

		for(var/entry in jsonData)

			// Critical problems that will prevent the track from working
			if(!istext(entry["url"]))
				/* Bastion of Endeavor Translation
				error("Jukebox entry in [filename]: bad or missing 'url'. Tracks must have a URL.")
				*/
				error("Трек в [filename]: недопустимый или отсутствующий URL. Треки должны обладать URL.")
				// End of Bastion of Endeavor Translation
				continue
			if(!istext(entry["title"]))
				/* Bastion of Endeavor Translation
				error("Jukebox entry in [filename]: bad or missing 'title'. Tracks must have a title.")
				*/
				error("Трек в [filename]: недопустимое или отсутствующее название. Треки должны обладать названием.")
				// End of Bastion of Endeavor Translation
				continue
			if(!isnum(entry["duration"]))
				/* Bastion of Endeavor Translation
				error("Jukebox entry in [filename]: bad or missing 'duration'. Tracks must have a duration (in deciseconds).")
				*/
				error("Трек в [filename]: недопустимая или отсутствующая длительность. Треки должны обладать длительностью (в декасекундах).")
				// End of Bastion of Endeavor Translation
				continue

			// Noncritical problems, we can keep going anyway, but warn so it can be fixed
			if(!istext(entry["artist"]))
				/* Bastion of Endeavor Translation
				warning("Jukebox entry in [filename], [entry["title"]]: bad or missing 'artist'. Please consider crediting the artist.")
				*/
				warning("Трек в [filename], [entry["title"]]: недопустимый или отсутствующий исполнитель. Убедительная просьба указать автора.")
				// End of Bastion of Endeavor Translation
			if(!istext(entry["genre"]))
				/* Bastion of Endeavor Translation
				warning("Jukebox entry in [filename], [entry["title"]]: bad or missing 'genre'. Please consider adding a genre.")
				*/
				warning("Трек в [filename], [entry["title"]]: недопустимый или отсутствующий жанр. Убедительная просьба указать жанр.")
				// End of Bastion of Endeavor Translation

			var/datum/track/T = new(entry["url"], entry["title"], entry["duration"], entry["artist"], entry["genre"])

			T.secret = entry["secret"] ? 1 : 0
			T.lobby = entry["lobby"] ? 1 : 0

			/// CHOMPstation edit start: Jack - Injecting casino track into new jukebox subsystem
			T.casino = entry["casino"] ? 1 : 0
			/// CHOMPstation edit end

			all_tracks += T

/datum/controller/subsystem/media_tracks/proc/sort_tracks()
	/* Bastion of Endeavor Translation
	report_progress("Sorting media tracks...")
	*/
	report_progress("Производится сортировка музыкальных треков...")
	// End of Bastion of Endeavor Translation
	sortTim(all_tracks, GLOBAL_PROC_REF(cmp_media_track_asc))

	jukebox_tracks.Cut()
	lobby_tracks.Cut()
	/// CHOMPstation edit start: Jack - Injecting casino track into new jukebox subsystem
	casino_tracks.Cut()
	/// CHOMPstation edit end

	for(var/datum/track/T in all_tracks)
		/// CHOMPstation edit start: Jack - Injecting casino track into new jukebox subsystem
		if(!T.secret && !T.casino)
			jukebox_tracks += T
		if(T.lobby)
			lobby_tracks += T
		if(T.casino)
			casino_tracks += T
		/// CHOMPstation edit end

/datum/controller/subsystem/media_tracks/proc/manual_track_add()
	var/client/C = usr.client
	if(!check_rights(R_DEBUG|R_FUN))
		return

	// Required
	/* Bastion of Endeavor Translation
	var/url = tgui_input_text(C, "REQUIRED: Provide URL for track, or paste JSON if you know what you're doing. See code comments.", "Track URL", multiline = TRUE)
	*/
	var/url = tgui_input_text(C, "ОБЯЗАТЕЛЬНО: Укажите URL трека, либо вставьте JSON, если умеете (см. комментарии в коде).", "URL трека", multiline = TRUE)
	// End of Bastion of Endeavor Translation
	if(!url)
		return

	var/list/json
	try
		json = json_decode(url)
	catch

	/**
	 * Alternatively to using a series of inputs, you can use json and paste it in.
	 * The json base element needs to be an array, even if it's only one song, so wrap it in []
	 * The songs are json object literals inside the base array and use these keys:
	 * "url": the url for the song (REQUIRED) (text)
	 * "title": the title of the song (REQUIRED) (text)
	 * "duration": duration of song in 1/10ths of a second (seconds * 10) (REQUIRED) (number)
	 * "artist": artist of the song (text)
	 * "genre": artist of the song, REALLY try to match an existing one (text)
	 * "secret": only on hacked jukeboxes (true/false)
	 * "lobby": plays in the lobby (true/false)
	 * "casino": plays in the casino (true/false) CHOMPstation casino
	 */

	if(islist(json))
		for(var/song in json)
			if(!islist(song))
				/* Bastion of Endeavor Translation
				to_chat(C, "<span class='warning'>Song appears to be malformed.</span>")
				*/
				to_chat(C, "<span class='warning'>Песня не соответствует формату.</span>")
				// End of Bastion of Endeavor Translation
				continue
			var/list/songdata = song
			if(!songdata["url"] || !songdata["title"] || !songdata["duration"])
				/* Bastion of Endeavor Translation
				to_chat(C, "<span class='warning'>URL, Title, or Duration was missing from a song. Skipping.</span>")
				*/
				to_chat(C, "<span class='warning'>В треке не указаны URL, название или длительность. Пропускаем.</span>")
				// End of Bastion of Endeavor Translation
				continue
			var/datum/track/T = new(songdata["url"], songdata["title"], songdata["duration"], songdata["artist"], songdata["genre"], songdata["secret"], songdata["lobby"], songdata["casino"]) //ChompEDIT, included 'casino'
			all_tracks += T

			/* Bastion of Endeavor Translation
			report_progress("New media track added by [C]: [T.title]")
			*/
			report_progress("[C] добавил новый музыкальный трек: [T.title]")
			// End of Bastion of Endeavor Translation
		sort_tracks()
		return

	/* Bastion of Endeavor Translation
	var/title = tgui_input_text(C, "REQUIRED: Provide title for track", "Track Title")
	*/
	var/title = tgui_input_text(C, "ОБЯЗАТЕЛЬНО: Укажите название трека.", "Название трека")
	// End of Bastion of Endeavor Translation
	if(!title)
		return

	/* Bastion of Endeavor Translation
	var/duration = tgui_input_number(C, "REQUIRED: Provide duration for track (in deciseconds, aka seconds*10)", "Track Duration")
	*/
	var/duration = tgui_input_number(C, "ОБЯЗАТЕЛЬНО: Укажите длительность трека (в декасекундах, т.е секунды*10).", "Длительность трека")
	// End of Bastion of Endeavor Translation
	if(!duration)
		return

	// Optional
	/* Bastion of Endeavor Translation
	var/artist = tgui_input_text(C, "Optional: Provide artist for track", "Track Artist")
	*/
	var/artist = tgui_input_text(C, "Дополнительно: Укажите исполнителя трека.", "Исполнитель трека")
	// End of Bastion of Endeavor Translation
	if(isnull(artist)) // Cancel rather than empty string
		return

	/* Bastion of Endeavor Translation
	var/genre = tgui_input_text(C, "Optional: Provide genre for track (try to match an existing one)", "Track Genre")
	*/
	var/genre = tgui_input_text(C, "Дополнительно: Укажите жанр трека (желательно использовать существующий).", "Жанр трека")
	// End of Bastion of Endeavor Translation
	if(isnull(genre)) // Cancel rather than empty string
		return

	/* Bastion of Endeavor Translation
	var/secret = tgui_alert(C, "Optional: Mark track as secret?", "Track Secret", list("Yes", "Cancel", "No"))
	*/
	var/secret = tgui_alert(C, "Дополнительно: Пометить трек как скрытый?", "Видимость трека", list("Да", "Отмена", "Нет"))
	// End of Bastion of Endeavor Translation
	/* Bastion of Endeavor Translation
	if(secret == "Cancel")
	*/
	if(secret == "Отмена")
	// End of Bastion of Endeavor Translation
		return
	/* Bastion of Endeavor Translation
	else if(secret == "Yes")
	*/
	else if(secret == "Да")
	// End of Bastion of Endeavor Translation
		secret = TRUE
	else
		secret = FALSE

	/* Bastion of Endeavor Translation
	var/lobby = tgui_alert(C, "Optional: Mark track as lobby music?", "Track Lobby", list("Yes", "Cancel", "No"))
	*/
	var/lobby = tgui_alert(C, "Дополнительно: Пометить трек как музыку для лобби?", "Проигрывание в лобби", list("Да", "Отмена", "Нет"))
	// End of Bastion of Endeavor Translation
	/* Bastion of Endeavor Translation
	if(lobby == "Cancel")
	*/
	if(lobby == "Отмена")
	// End of Bastion of Endeavor Translation
		return
	/* Bastion of Endeavor Translation
	else if(secret == "Yes")
	*/
	else if(secret == "Да")
	// End of Bastion of Endeavor Translation
		secret = TRUE
	else
		secret = FALSE

	/// CHOMPstation edit start: Jack - Injecting casino track into new jukebox subsystem
	/* Bastion of Endeavor Translation
	var/casino = tgui_alert(C, "Optional: Mark track as casino music?", "Track Casino", list("Yes", "Cancel", "No"))
	if(casino == "Cancel")
		return
	else if(secret == "Yes")
	*/
	var/casino = tgui_alert(C, "Дополнительно: Отметить как музыку в казино?", "Воспроизведение в казино", list("Да", "Отмена", "Нет"))
	if(casino == "Отмена")
		return
	else if(secret == "Да")
	// End of Bastion of Endeavor Translation
		secret = TRUE
	else
		secret = FALSE
	/// CHOMPstation edit end

	var/datum/track/T = new(url, title, duration, artist, genre)

	T.secret = secret
	T.lobby = lobby
	/// CHOMPstation edit start: Jack - Injecting casino track into new jukebox subsystem
	T.casino = casino
	/// CHOMPstation edit end

	all_tracks += T

	/* Bastion of Endeavor Translation
	report_progress("New media track added by [C]: [title]")
	*/
	report_progress("[C] добавил новый музыкальный трек: [title]")
	// End of Bastion of Endeavor Translation
	sort_tracks()

/datum/controller/subsystem/media_tracks/proc/manual_track_remove()
	var/client/C = usr.client
	if(!check_rights(R_DEBUG|R_FUN))
		return

	/* Bastion of Endeavor Translation
	var/track = tgui_input_text(C, "Input track title or URL to remove (must be exact)", "Remove Track")
	*/
	var/track = tgui_input_text(C, "Введите точное название или URL удаляемого трека.", "Удаление трека")
	// End of Bastion of Endeavor Translation
	if(!track)
		return

	for(var/datum/track/T in all_tracks)
		if(T.title == track || T.url == track)
			all_tracks -= T
			qdel(T)
			/* Bastion of Endeavor Translation
			report_progress("Media track removed by [C]: [track]")
			*/
			report_progress("[C] удалил музыкальный трек: [track].")
			// End of Bastion of Endeavor Translation
			sort_tracks()
			return

	/* Bastion of Endeavor Translation
	to_chat(C, "<span class='warning>Couldn't find a track matching the specified parameters.</span>")
	*/
	to_chat(C, "<span class='warning>Не удалось найти соответствующий заданным параметрам трек.</span>")
	// End of Bastion of Endeavor Translation

/datum/controller/subsystem/media_tracks/proc/add_track(var/mob/user, var/new_url, var/new_title, var/new_duration, var/new_artist, var/new_genre, var/new_secret, var/new_lobby)
	if(!check_rights(R_DEBUG|R_FUN))
		return
	var/datum/track/T = new(new_url, new_title, new_duration, new_artist, new_genre, new_secret, new_lobby)
	all_tracks += T
	/* Bastion of Endeavor Translation
	report_progress("Media track added by [user]: [T.title]")
	*/
	report_progress("Пользователь [user] добавил музыкальный трек: [T.title]")
	// End of Bastion of Endeavor Translation
	sort_tracks()
	return

/datum/controller/subsystem/media_tracks/proc/remove_track(var/mob/user, var/datum/track/T)
	if(!check_rights(R_DEBUG|R_FUN))
		return

	if(!T)
		return

	/* Bastion of Endeavor Translation
	report_progress("Media track removed by [user]: [T.title]")
	*/
	report_progress("Пользователь [user] удалил музыкальный трек: [T.title]")
	// End of Bastion of Endeavor Translation
	all_tracks -= T
	qdel(T)
	sort_tracks()
	return

/datum/controller/subsystem/media_tracks/vv_get_dropdown()
	. = ..()
	VV_DROPDOWN_OPTION("", "---")
	/* Bastion of Endeavor Translation
	VV_DROPDOWN_OPTION("add_track", "Add New Track")
	VV_DROPDOWN_OPTION("remove_track", "Remove Track")
	*/
	VV_DROPDOWN_OPTION("add_track", "Добавить новый трек")
	VV_DROPDOWN_OPTION("remove_track", "Удалить трек")
	// End of Bastion of Endeavor Translation

/datum/controller/subsystem/media_tracks/vv_do_topic(list/href_list)
	. = ..()
	IF_VV_OPTION("add_track")
		manual_track_add()
		href_list["datumrefresh"] = "\ref[src]"
	IF_VV_OPTION("remove_track")
		manual_track_remove()
		href_list["datumrefresh"] = "\ref[src]"
