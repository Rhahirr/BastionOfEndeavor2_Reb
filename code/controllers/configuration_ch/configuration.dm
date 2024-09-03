/datum/controller/configuration
	/* Bastion of Endeavor Translation
	name = "Configuration"
	*/
	name = "Конфигурация"
	// End of Bastion of Endeavor Translation

	var/directory = "config"

	var/warned_deprecated_configs = FALSE
	var/hiding_entries_by_type = TRUE //Set for readability, admins can set this to FALSE if they want to debug it
	var/list/entries
	var/list/entries_by_type

	//var/list/maplist
	//var/datum/map_config/defaultmap

	var/list/modes // allowed modes
	var/list/gamemode_cache
	var/list/votable_modes // votable modes
	var/list/mode_names
	var/list/mode_reports
	var/list/mode_false_report_weight

	var/motd
	var/policy

	/// If the configuration is loaded
	var/loaded = FALSE

	/// A regex that matches words blocked IC
	var/static/regex/ic_filter_regex

	/// A regex that matches words blocked OOC
	var/static/regex/ooc_filter_regex

	/// A regex that matches words blocked IC, but not in PDAs
	var/static/regex/ic_outside_pda_filter_regex

	/// A regex that matches words soft blocked IC
	var/static/regex/soft_ic_filter_regex

	/// A regex that matches words soft blocked OOC
	var/static/regex/soft_ooc_filter_regex

	/// A regex that matches words soft blocked IC, but not in PDAs
	var/static/regex/soft_ic_outside_pda_filter_regex

	/// An assoc list of blocked IC words to their reasons
	var/static/list/ic_filter_reasons

	/// An assoc list of words that are blocked IC, but not in PDAs, to their reasons
	var/static/list/ic_outside_pda_filter_reasons

	/// An assoc list of words that are blocked both IC and OOC to their reasons
	var/static/list/shared_filter_reasons

	/// An assoc list of soft blocked IC words to their reasons
	var/static/list/soft_ic_filter_reasons

	/// An assoc list of words that are soft blocked IC, but not in PDAs, to their reasons
	var/static/list/soft_ic_outside_pda_filter_reasons

	/// An assoc list of words that are soft blocked both IC and OOC to their reasons
	var/static/list/soft_shared_filter_reasons

	/// A list of configuration errors that occurred during load
	var/static/list/configuration_errors

/datum/controller/configuration/proc/admin_reload()
	if(IsAdminAdvancedProcCall())
		return
	/* Bastion of Endeavor Translation
	log_admin("[key_name_admin(usr)] has forcefully reloaded the configuration from disk.")
	message_admins("[key_name_admin(usr)] has forcefully reloaded the configuration from disk.")
	*/
	log_admin("[key_name_admin(usr)] принудительно перезагрузил конфигурацию с диска.")
	message_admins("[key_name_admin(usr)] принудительно перезагрузил конфигурацию с диска.")
	// End of Bastion of Endeavor Translation
	full_wipe()
	Load(world.params[OVERRIDE_CONFIG_DIRECTORY_PARAMETER])

/datum/controller/configuration/proc/Load(_directory)
	if(IsAdminAdvancedProcCall()) //If admin proccall is detected down the line it will horribly break everything.
		return
	if(_directory)
		directory = _directory
	if(entries)
		/* Bastion of Endeavor Translation
		CRASH("/datum/controller/configuration/Load() called more than once!")
		*/
		CRASH("/datum/controller/configuration/Load() вызван более одного раза!")
		// End of Bastion of Endeavor Translation
	configuration_errors ||= list()
	InitEntries()
	if(fexists("[directory]/config.txt") && LoadEntries("config.txt") <= 1)
		var/list/legacy_configs = list("game_options.txt", "dbconfig.txt", "comms.txt")
		for(var/I in legacy_configs)
			if(fexists("[directory]/[I]"))
				/* Bastion of Endeavor Translation
				log_config("No $include directives found in config.txt! Loading legacy [legacy_configs.Join("/")] files...")
				*/
				log_config("В config.txt не найдены директивы $include! Загружаем устаревшие файлы [legacy_configs.Join("/")]...")
				// End of Bastion of Endeavor Translation
				for(var/J in legacy_configs)
					LoadEntries(J)
				break
	if (fexists("[directory]/dev_overrides.txt"))
		LoadEntries("dev_overrides.txt")
	if (fexists("[directory]/ezdb.txt"))
		LoadEntries("ezdb.txt")
	//loadmaplist(CONFIG_MAPS_FILE)
	LoadMOTD()
	LoadPolicy()
	LoadChatFilter()
	LoadModes()
	/*
	if(CONFIG_GET(flag/load_jobs_from_txt))
		validate_job_config()
		if(SSjob.initialized) // in case we're reloading from disk after initialization, wanna make sure the changes update in the ongoing shift
			SSjob.load_jobs_from_config()
	*/

	if(CONFIG_GET(flag/usewhitelist))
		load_whitelist()

	loaded = TRUE

	if (Master)
		Master.OnConfigLoad()
	process_config_errors()

/datum/controller/configuration/proc/full_wipe()
	if(IsAdminAdvancedProcCall())
		return
	entries_by_type.Cut()
	QDEL_LIST_ASSOC_VAL(entries)
	entries = null
	//QDEL_LIST_ASSOC_VAL(maplist)
	//maplist = null
	//QDEL_NULL(defaultmap)
	configuration_errors?.Cut()

/datum/controller/configuration/Destroy()
	full_wipe()
	config = null

	return ..()

/datum/controller/configuration/proc/log_config_error(error_message)
	configuration_errors += error_message
	log_config(error_message)

/datum/controller/configuration/proc/process_config_errors()
	if(!CONFIG_GET(flag/config_errors_runtime))
		return
	for(var/error_message in configuration_errors)
		stack_trace(error_message)

/datum/controller/configuration/proc/InitEntries()
	var/list/_entries = list()
	entries = _entries
	var/list/_entries_by_type = list()
	entries_by_type = _entries_by_type

	for(var/I in typesof(/datum/config_entry)) //typesof is faster in this case
		var/datum/config_entry/E = I
		if(initial(E.config_abstract_type) == I)
			continue
		E = new I
		var/esname = E.name
		var/datum/config_entry/test = _entries[esname]
		if(test)
			/* Bastion of Endeavor Translation
			log_config_error("Error: [test.type] has the same name as [E.type]: [esname]! Not initializing [E.type]!")
			*/
			log_config_error("Ошибка: [test.type] обладает тем же именем, что и [E.type]: [esname]! Пропускаем инициализацию [E.type]!")
			// End of Bastion of Endeavor Translation
			qdel(E)
			continue
		_entries[esname] = E
		_entries_by_type[I] = E

/datum/controller/configuration/proc/RemoveEntry(datum/config_entry/CE)
	entries -= CE.name
	entries_by_type -= CE.type

/datum/controller/configuration/proc/LoadEntries(filename, list/stack = list())
	if(IsAdminAdvancedProcCall())
		return

	var/filename_to_test = world.system_type == MS_WINDOWS ? lowertext(filename) : filename
	if(filename_to_test in stack)
		/* Bastion of Endeavor Translation
		log_config_error("Warning: Config recursion detected ([english_list(stack)]), breaking!")
		*/
		log_config_error("Внимание: Обнаружена рекурсия в конфигурации ([english_list(stack)]), прерываемся!")
		// End of Bastion of Endeavor Translation
		return
	stack = stack + filename_to_test

	/* Bastion of Endeavor Translation
	log_config("Loading config file [filename]...")
	*/
	log_config("Загрузка файла конфигурации [filename]...")
	// End of Bastion of Endeavor Translation
	var/list/lines = world.file2list("[directory]/[filename]")
	var/list/_entries = entries
	for(var/L in lines)
		L = trim(L)
		if(!L)
			continue

		var/firstchar = L[1]
		if(firstchar == "#")
			continue

		var/lockthis = firstchar == "@"
		/* Bastion of Endeavor Unicode Edit
		if(lockthis)
			L = copytext(L, length(firstchar) + 1)

		var/pos = findtext(L, " ")
		*/
		if(lockthis)
			L = copytext_char(L, length_char(firstchar) + 1)

		var/pos = findtext_char(L, " ")
		// End of Bastion of Endeavor Unicode Edit
		var/entry = null
		var/value = null

		if(pos)
			/* Bastion of Endeavor Unicode Edit
			entry = lowertext(copytext(L, 1, pos))
			value = copytext(L, pos + length(L[pos]))
			*/
			entry = lowertext(copytext_char(L, 1, pos))
			value = copytext_char(L, pos + length_char(L[pos]))
			// End of Bastion of Endeavor Unicode Edit
		else
			entry = lowertext(L)

		if(!entry)
			continue

		if(entry == "$include")
			if(!value)
				/* Bastion of Endeavor Translation
				log_config_error("Warning: Invalid $include directive: [value]")
				*/
				log_config_error("Внимание: Недопустимая директива $include: [value].")
				// End of Bastion of Endeavor Translation
			else
				LoadEntries(value, stack)
				++.
			continue

		// Reset directive, used for setting a config value back to defaults. Useful for string list config types
		if (entry == "$reset")
			var/datum/config_entry/resetee = _entries[lowertext(value)]
			if (!value || !resetee)
				/* Bastion of Endeavor Translation
				log_config_error("Warning: invalid $reset directive: [value]")
				*/
				log_config_error("Внимание: Недопустимая директива $reset: [value].")
				// End of Bastion of Endeavor Translation
				continue
			resetee.set_default()
			/* Bastion of Endeavor Translation
			log_config("Reset configured value for [value] to original defaults")
			*/
			log_config("Сброс значения конфигурации [value] до значения по умолчанию.")
			// End of Bastion of Endeavor Translation
			continue

		var/datum/config_entry/E = _entries[entry]
		if(!E)
			/* Bastion of Endeavor Translation
			log_config("Unknown setting in configuration: '[entry]'")
			*/
			log_config("Неизвестная настройка конфигурации: '[entry]'")
			// End of Bastion of Endeavor Translation
			continue

		if(lockthis)
			E.protection |= CONFIG_ENTRY_LOCKED

		if(E.deprecated_by)
			var/datum/config_entry/new_ver = entries_by_type[E.deprecated_by]
			var/new_value = E.DeprecationUpdate(value)
			var/good_update = istext(new_value)
			/* Bastion of Endeavor Translation
			log_config("Entry [entry] is deprecated and will be removed soon. Migrate to [new_ver.name]![good_update ? " Suggested new value is: [new_value]" : ""]")
			*/
			log_config("Запись [entry] не поддерживается и скоро будет удалена. Используйте [new_ver.name]![good_update ? " Предлагаемое значение: [new_value]" : ""]")
			// End of Bastion of Endeavor Translation
			if(!warned_deprecated_configs)
				/* Bastion of Endeavor Translation
				DelayedMessageAdmins("This server is using deprecated configuration settings. Please check the logs and update accordingly.")
				*/
				DelayedMessageAdmins("Сервер использует устаревшие настройки конфигурации. Пожалуйста, проверьте логи и обновите их соответствующим образом.")
				// End of Bastion of Endeavor Translation
				warned_deprecated_configs = TRUE
			if(good_update)
				value = new_value
				E = new_ver
			else
				/* Bastion of Endeavor Translation
				warning("[new_ver.type] is deprecated but gave no proper return for DeprecationUpdate()")
				*/
				warning("[new_ver.type] устарел и не даёт правильный return для DeprecationUpdate().")
				// End of Bastion of Endeavor Translation

		var/validated = E.ValidateAndSet(value)
		if(!validated)
			/* Bastion of Endeavor Translation
			var/log_message = "Failed to validate setting \"[value]\" for [entry]"
			*/
			var/log_message = "Не удалось проверить настройку \"[value]\" для [entry]."
			// End of Bastion of Endeavor Translation
			log_config(log_message)
			stack_trace(log_message)
		else
			if(E.modified && !E.dupes_allowed && E.resident_file == filename)
				/* Bastion of Endeavor Translation
				log_config_error("Duplicate setting for [entry] ([value], [E.resident_file]) detected! Using latest.")
				*/
				log_config_error("Дубликат настройки [entry] ([value], [E.resident_file])! Используем последнее значение.")
				// End of Bastion of Endeavor Translation

		E.resident_file = filename

		if(validated)
			E.modified = TRUE

	++.

/datum/controller/configuration/can_vv_get(var_name)
	return (var_name != NAMEOF(src, entries_by_type) || !hiding_entries_by_type) && ..()

/datum/controller/configuration/vv_edit_var(var_name, var_value)
	var/list/banned_edits = list(NAMEOF(src, entries_by_type), NAMEOF(src, entries), NAMEOF(src, directory))
	return !(var_name in banned_edits) && ..()

/datum/controller/configuration/stat_entry(msg)
	/* Bastion of Endeavor Translation
	msg = "Edit"
	*/
	msg = "Редактировать"
	// End of Bastion of Endeavor Translation
	return msg

/datum/controller/configuration/proc/Get(entry_type)
	var/datum/config_entry/E = entry_type
	var/entry_is_abstract = initial(E.config_abstract_type) == entry_type
	if(entry_is_abstract)
		/* Bastion of Endeavor Translation
		CRASH("Tried to retrieve an abstract config_entry: [entry_type]")
		*/
		CRASH("Попытка получить значение абстрактной записи конфигурации config_entry: [entry_type].")
		// End of Bastion of Endeavor Translation
	E = entries_by_type[entry_type]
	if(!E)
		/* Bastion of Endeavor Translation
		CRASH("Missing config entry for [entry_type]!")
		*/
		CRASH("Отсутствующее значение конфигурации для [entry_type]!")
		// End of Bastion of Endeavor Translation
	if((E.protection & CONFIG_ENTRY_HIDDEN) && IsAdminAdvancedProcCall() && GLOB.LastAdminCalledProc == "Get" && GLOB.LastAdminCalledTargetRef == "[REF(src)]")
		//log_admin_private("Config access of [entry_type] attempted by [key_name(usr)]")
		/* Bastion of Endeavor Translation: I don't think we need to translate the Get above?
		log_admin("Config access of [entry_type] attempted by [key_name(usr)]")
		*/
		log_admin("[key_name(usr)] попытался получить доступ к значению конфигурации [entry_type].")
		// End of Bastion of Endeavor Translation
		return
	return E.config_entry_value

/datum/controller/configuration/proc/Set(entry_type, new_val)
	var/datum/config_entry/E = entry_type
	var/entry_is_abstract = initial(E.config_abstract_type) == entry_type
	if(entry_is_abstract)
		/* Bastion of Endeavor Translation
		CRASH("Tried to set an abstract config_entry: [entry_type]")
		*/
		CRASH("Попытка установить значение абстрактной записи конфигурации config_entry: [entry_type].")
		// End of Bastion of Endeavor Translation
	E = entries_by_type[entry_type]
	if(!E)
		/* Bastion of Endeavor Translation
		CRASH("Missing config entry for [entry_type]!")
		*/
		CRASH("Отсутствующее значение конфигурации для [entry_type]!")
		// End of Bastion of Endeavor Translation
	if((E.protection & CONFIG_ENTRY_LOCKED) && IsAdminAdvancedProcCall() && GLOB.LastAdminCalledProc == "Set" && GLOB.LastAdminCalledTargetRef == "[REF(src)]")
		//log_admin_private("Config rewrite of [entry_type] to [new_val] attempted by [key_name(usr)]")
		/* Bastion of Endeavor Translation
		log_admin("Config rewrite of [entry_type] to [new_val] attempted by [key_name(usr)]")
		*/
		log_admin("[key_name(usr)] попытался изменить значение конфигурации [entry_type] на [new_val].")
		// End of Bastion of Endeavor Translation
		return
	return E.ValidateAndSet("[new_val]")

/datum/controller/configuration/proc/LoadMOTD()
	var/list/motd_contents = list()

	var/list/motd_list = CONFIG_GET(str_list/motd)
	if (motd_list.len == 0 && fexists("[directory]/motd.txt"))
		motd_list = list("motd.txt")

	for (var/motd_file in motd_list)
		if (fexists("[directory]/[motd_file]"))
			motd_contents += file2text("[directory]/[motd_file]")
		else
			log_config("MOTD file [motd_file] didn't exist")
			DelayedMessageAdmins("MOTD file [motd_file] didn't exist")

	motd = motd_contents.Join("\n")

	var/tm_info = GLOB.revdata.GetTestMergeInfo()
	if(motd || tm_info)
		motd = motd ? "[motd]<br>[tm_info]" : tm_info

/*
Policy file should be a json file with a single object.
Value is raw html.

Possible keywords :
Job titles / Assigned roles (ghost spawners for example) : Assistant , Captain , Ash Walker
Mob types : /mob/living/basic/carp
Antagonist types : /datum/antagonist/highlander
Species types : /datum/species/lizard
special keywords defined in _DEFINES/admin.dm

Example config:
{
	JOB_ASSISTANT : "Don't kill everyone",
	"/datum/antagonist/highlander" : "<b>Kill everyone</b>",
	"Ash Walker" : "Kill all spacemans"
}

*/
/datum/controller/configuration/proc/LoadPolicy()
	policy = list()
	var/rawpolicy = file2text("[directory]/policy.json")
	if(rawpolicy)
		var/parsed = safe_json_decode(rawpolicy)
		if(!parsed)
			/* Bastion of Endeavor Translation
			log_config("JSON parsing failure for policy.json")
			DelayedMessageAdmins("JSON parsing failure for policy.json")
			*/
			log_config("Не удалась обработка JSON в policy.json")
			DelayedMessageAdmins("Не удалась обработка JSON в policy.json")
			// End of Bastion of Endeavor Translation
		else
			policy = parsed

/*
/datum/controller/configuration/proc/loadmaplist(filename)
	log_config("Loading config file [filename]...")
	filename = "[directory]/[filename]"
	var/list/Lines = world.file2list(filename)

	var/datum/map_config/currentmap = null
	for(var/t in Lines)
		if(!t)
			continue

		t = trim(t)
		if(length(t) == 0)
			continue
		else if(t[1] == "#")
			continue

		var/pos = findtext(t, " ")
		var/command = null
		var/data = null

		if(pos)
			command = lowertext(copytext(t, 1, pos))
			data = copytext(t, pos + length(t[pos]))
		else
			command = lowertext(t)

		if(!command)
			continue

		if (!currentmap && command != "map")
			continue

		switch (command)
			if ("map")
				currentmap = load_map_config(data, MAP_DIRECTORY_MAPS)
				if(currentmap.defaulted)
					var/error_message = "Failed to load map config for [data]!"
					log_config(error_message)
					log_mapping(error_message, TRUE)
					currentmap = null
			if ("minplayers","minplayer")
				currentmap.config_min_users = text2num(data)
			if ("maxplayers","maxplayer")
				currentmap.config_max_users = text2num(data)
			if ("weight","voteweight")
				currentmap.voteweight = text2num(data)
			if ("default","defaultmap")
				defaultmap = currentmap
			if ("votable")
				currentmap.votable = TRUE
			if ("endmap")
				LAZYINITLIST(maplist)
				maplist[currentmap.map_name] = currentmap
				currentmap = null
			if ("disabled")
				currentmap = null
			else
				log_config("Unknown command in map vote config: '[command]'")
*/

/datum/controller/configuration/proc/LoadChatFilter()
	if(!fexists("[directory]/word_filter.toml"))
		load_legacy_chat_filter()
		return

	/* Bastion of Endeavor Translation
	log_config("Loading config file word_filter.toml...")
	*/
	log_config("Загрузка конфигурации словесного фильтра word_filter.toml...")
	// End of Bastion of Endeavor Translation
	var/list/result = rustg_raw_read_toml_file("[directory]/word_filter.toml")
	if(!result["success"])
		/* Bastion of Endeavor Translation
		var/message = "The word filter is not configured correctly! [result["content"]]"
		*/
		var/message = "Ошибка настройки словесного фильтра! [result["content"]]"
		// End of Bastion of Endeavor Translation
		log_config(message)
		DelayedMessageAdmins(message)
		return
	var/list/word_filter = json_decode(result["content"])

	ic_filter_reasons = try_extract_from_word_filter(word_filter, "ic")
	ic_outside_pda_filter_reasons = try_extract_from_word_filter(word_filter, "ic_outside_pda")
	shared_filter_reasons = try_extract_from_word_filter(word_filter, "shared")
	soft_ic_filter_reasons = try_extract_from_word_filter(word_filter, "soft_ic")
	soft_ic_outside_pda_filter_reasons = try_extract_from_word_filter(word_filter, "soft_ic_outside_pda")
	soft_shared_filter_reasons = try_extract_from_word_filter(word_filter, "soft_shared")

	update_chat_filter_regexes()

/datum/controller/configuration/proc/load_legacy_chat_filter()
	if (!fexists("[directory]/in_character_filter.txt"))
		return

	/* Bastion of Endeavor Translation
	log_config("Loading config file in_character_filter.txt...")
	*/
	log_config("Загрузка конфигурации in_character_filter.txt...")
	// End of Bastion of Endeavor Translation

	ic_filter_reasons = list()
	ic_outside_pda_filter_reasons = list()
	shared_filter_reasons = list()
	soft_ic_filter_reasons = list()
	soft_ic_outside_pda_filter_reasons = list()
	soft_shared_filter_reasons = list()

	for (var/line in world.file2list("[directory]/in_character_filter.txt"))
		if (!line)
			continue
		/* Bastion of Endeavor Unicode Edit
		if (findtextEx(line, "#", 1, 2))
		*/
		if (findtextEx_char(line, "#", 1, 2))
		// End of Bastion of Endeavor Unicode Edit
			continue
		// The older filter didn't apply to PDA
		/* Bastion of Endeavor Translation
		ic_outside_pda_filter_reasons[line] = "No reason available"
		*/
		ic_outside_pda_filter_reasons[line] = "Причина отсутствует"
		// End of Bastion of Endeavor Translation

	update_chat_filter_regexes()

/// Will update the internal regexes of the chat filter based on the filter reasons
/datum/controller/configuration/proc/update_chat_filter_regexes()
	ic_filter_regex = compile_filter_regex(ic_filter_reasons + ic_outside_pda_filter_reasons + shared_filter_reasons)
	ic_outside_pda_filter_regex = compile_filter_regex(ic_filter_reasons + shared_filter_reasons)
	ooc_filter_regex = compile_filter_regex(shared_filter_reasons)
	soft_ic_filter_regex = compile_filter_regex(soft_ic_filter_reasons + soft_ic_outside_pda_filter_reasons + soft_shared_filter_reasons)
	soft_ic_outside_pda_filter_regex = compile_filter_regex(soft_ic_filter_reasons + soft_shared_filter_reasons)
	soft_ooc_filter_regex = compile_filter_regex(soft_shared_filter_reasons)

/datum/controller/configuration/proc/try_extract_from_word_filter(list/word_filter, key)
	var/list/banned_words = word_filter[key]

	if (isnull(banned_words))
		return list()
	else if (!islist(banned_words))
		/* Bastion of Endeavor Translation
		var/message = "The word filter configuration's '[key]' key was invalid, contact someone with configuration access to make sure it's setup properly."
		*/
		var/message = "Ключ конфигурации словесного фильтра '[key]' не является допустимым, убедитесь в точности настройки конфигурации."
		// End of Bastion of Endeavor Translation
		log_config(message)
		DelayedMessageAdmins(message)
		return list()

	var/list/formatted_banned_words = list()

	for (var/banned_word in banned_words)
		formatted_banned_words[lowertext(banned_word)] = banned_words[banned_word]
	return formatted_banned_words

/datum/controller/configuration/proc/compile_filter_regex(list/banned_words)
	if (isnull(banned_words) || banned_words.len == 0)
		return null

	var/static/regex/should_join_on_word_bounds = regex(@"^\w+$")

	// Stuff like emoticons needs another split, since there's no way to get ":)" on a word bound.
	// Furthermore, normal words need to be on word bounds, so "(adminhelp)" gets filtered.
	var/list/to_join_on_whitespace_splits = list()
	var/list/to_join_on_word_bounds = list()

	for (var/banned_word in banned_words)
		/* Bastion of Endeavor Unicode Edit
		if (findtext(banned_word, should_join_on_word_bounds))
		*/
		if (findtext_char(banned_word, should_join_on_word_bounds))
		// End of Bastion of Endeavor Unicode Edit
			to_join_on_word_bounds += REGEX_QUOTE(banned_word)
		else
			to_join_on_whitespace_splits += REGEX_QUOTE(banned_word)

	// We don't want a whitespace_split part if there's no stuff that requires it
	var/whitespace_split = to_join_on_whitespace_splits.len > 0 ? @"(?:(?:^|\s+)(" + jointext(to_join_on_whitespace_splits, "|") + @")(?:$|\s+))" : ""
	var/word_bounds = @"(\b(" + jointext(to_join_on_word_bounds, "|") + @")\b)"
	var/regex_filter = whitespace_split != "" ? "([whitespace_split]|[word_bounds])" : word_bounds
	return regex(regex_filter, "i")

/*
/// Check to ensure that the jobconfig is valid/in-date.
/datum/controller/configuration/proc/validate_job_config()
	var/config_toml = "[directory]/jobconfig.toml"
	var/config_txt = "[directory]/jobs.txt"
	var/message = "Notify Server Operators: "
	log_config("Validating config file jobconfig.toml...")

	if(!fexists(file(config_toml)))
		SSjob.legacy_mode = TRUE
		message += "jobconfig.toml not found, falling back to legacy mode (using jobs.txt). To surpress this warning, generate a jobconfig.toml by running the verb 'Generate Job Configuration' in the Server tab.\n\
			From there, you can then add it to the /config folder of your server to have it take effect for future rounds."

		if(!fexists(file(config_txt)))
			message += "\n\nFailed to set up legacy mode, jobs.txt not found! Codebase defaults will be used. If you do not wish to use this system, please disable it by commenting out the LOAD_JOBS_FROM_TXT config flag."

		log_config(message)
		DelayedMessageAdmins(span_notice(message))
		return

	var/list/result = rustg_raw_read_toml_file(config_toml)
	if(!result["success"])
		message += "The job config (jobconfig.toml) is not configured correctly! [result["content"]]"
		log_config(message)
		DelayedMessageAdmins(span_notice(message))
*/

//Message admins when you can.
/datum/controller/configuration/proc/DelayedMessageAdmins(text)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(message_admins), text), 0)
