// Weird grammar bullshit goes here

var/global/enable_case_logging_ru = 0
var/global/enable_case_reporting_ru = 0

var/global/list/successful_cases_ru = list()

/datum/New() // radical? yes. will it break things? won't know until we try.
	cases_ru = new /list()
	cases_ru = list("basic" = basic_cases_list_ru)
#if !(UNIT_TEST)
	construct_cases_ru()
#endif
	..()

/atom/New() // radical? yes. will it break things? won't know until we try.
	cases_ru = new /list()
	cases_ru = list("basic" = basic_cases_list_ru)
#if !(UNIT_TEST)
	construct_cases_ru()
#endif
	..()

/datum/proc/create_cases_ru(var/subcase)
	if(subcase)
		cases_ru[subcase] = new /list()
		cases_ru[subcase] = basic_cases_list_ru
	else
		cases_ru.Add(basic_cases_list_ru)

// Bastion of Endeavor TODO: clean this up, and split by separating characters (" " and "-") rather than splittext
/proc/blueprint_to_list_ru(var/list/case_blueprint_ru)
	var/list/returning_case_list = new /list()														// what we're going to be outputting, basically
	for(var/current_blueprint=1, current_blueprint<=case_blueprint_ru.len, current_blueprint++)		// so for every template in the list we are provided with
		var/list/big_conjoined_list = list()
		var/list/split_by_bar = splittext_char(case_blueprint_ru[current_blueprint], "|")
		var/list/split_by_bar_purged = split_by_bar.Copy()
		split_by_bar_purged.Cut(1,2)
		if(split_by_bar_purged)
			for(var/templ=1, templ<=split_by_bar_purged.len, templ++)
				big_conjoined_list.Add(.(list(split_by_bar_purged[templ])))
		var/list/working_blueprint = splittext_char(split_by_bar[1], "#") 		// let's break it down to grab the rugender, the words and the case key, and then the conjoined word blueprints
		if(working_blueprint.len == 1 && (ticker.current_state >= GAME_STATE_INIT))																// if we're missing the gender its best to just drop the proc
			log_grammar_ru("ОШИБКА: не указан род/число шаблона: [case_blueprint_ru[current_blueprint]]. Используем мужской род, ед.ч., по умолчанию.")
			error("Не указан род/число шаблона: [case_blueprint_ru[current_blueprint]]. Используем мужской род, ед.ч., по умолчанию.")
			working_blueprint.Insert(1, "муж")															// except the show must go on and we'll just assume male gender as default
		else if (working_blueprint.len > 3)																// if we have more separators than we need, it's okay, but i'll want to clean it up
			log_grammar_ru("ВНИМАНИЕ: шаблон содержит более двух разделителей: [case_blueprint_ru[current_blueprint]]")
			warning("Шаблон содержит более двух разделителей: [case_blueprint_ru[current_blueprint]]")
		var/list/template_list = list(RUGENDER = shortrugender2gender_ru(working_blueprint[1]), "wordbase" = working_blueprint[2])
		if(listgetindex(working_blueprint, 3))
			template_list["casekey"] = working_blueprint[3]
		var/list/temp_cases_list = list(NCASE = "", GCASE = "", DCASE = "", ACASE = "", ICASE = "", PCASE = "", PLURAL_NCASE = "", PLURAL_GCASE = "", PLURAL_DCASE = "", PLURAL_ACASE = "", PLURAL_ICASE = "", PLURAL_PCASE = "") // our list of 6 basic grammar cases
		var/list/word_list = splittext_char(template_list["wordbase"], " ")								// now, let's break down the rest and separate the words
		// word_list = "безымянн;1a", "подарок&подарк;3*a", "для", "проверки", "падежей"
		for(var/j=1, j<=word_list.len, j++)												// alright, so for every word that we have in wordbase
			if(findtext_char(word_list[j], ";"))										// if the word contains a ; that defines our word ending
				var/list/constructor_list = splittext_char(word_list[j], ";")			// then take it apart and store it in a list
				var/endings_key = "[template_list[RUGENDER]]_[constructor_list[2]]"
				if(GLOB.case_repository_ru.Find(endings_key))
					var/string_to_fill = strip_accent_ru(GLOB.case_repository_ru[endings_key])
					var/list/word_bases_list = splittext_char(constructor_list[1], "&")
					var/z = 0
					for(var/word_base in word_bases_list)
						string_to_fill = replacetext_char(string_to_fill, "{{{основа[z == 0? "" : z]}}}",  word_bases_list[z+1])
						z++
					var/list/complete_word_list = splittext_char(string_to_fill, ";")
					var/i = 0															// the reason im not using i in the for loop itself is that
					for(var/case in temp_cases_list)									// we want to refer to the case by its name
						i++																// but we also want a counting var
						temp_cases_list[case] += "[j == 1? "" : "[copytext_char(complete_word_list[i], 1, 2) == "-" ? "" : " "]"][complete_word_list[i]]"
				else
					log_grammar_ru("ОШИБКА: Ключ [endings_key] не найден. Шаблон [case_blueprint_ru[current_blueprint]].")
					error("Ключ [endings_key] не найден. Шаблон [case_blueprint_ru[current_blueprint]].")
					continue
			else																			// if the word doesn't contain a ;
				for(var/case_extra in temp_cases_list)											// then for every case it has
					var/output_word = word_list[j]
					var/small_cj_count
					for(var/small_conjoined_list in big_conjoined_list)
						small_cj_count++
						var/cj_string_to_replace = "@[small_cj_count]"
						var/cj_string_to_replace_with = big_conjoined_list[small_conjoined_list][case_extra]
						output_word = replacetext_char(output_word, cj_string_to_replace, cj_string_to_replace_with)
					temp_cases_list[case_extra] += "[j == 1? "" : "[copytext_char(output_word, 1, 2) == "-" ? "" : " "]"][output_word]"	// just slap the word in and call it a day
		var/list/final_cases_list = list(RUGENDER = template_list[RUGENDER], PLURAL_RUGENDER = "plural")		// now just toss the rugender in
		final_cases_list.Add(temp_cases_list)											// and compile it into a final list
		if(listgetindex(template_list, "casekey"))									// and if we happen to have a case key,
			returning_case_list[listgetindex(template_list, "casekey")] = final_cases_list			// then make into a nested list
		else
			returning_case_list["basic"] = final_cases_list
	return returning_case_list

/datum/proc/construct_cases_ru()
	if(isnull(case_blueprint_ru))
		return
	if(!(islist(case_blueprint_ru)))
		log_grammar_ru("Ошибка: шаблон [src.type] не в формате списка! [case_blueprint_ru]")
		error("Ошибка: шаблон падежей [src.type] не в формате списка! [case_blueprint_ru]")
		return
	else if (case_blueprint_ru.len == 0)
		return
	if(enable_case_logging_ru) log_grammar_ru("Производится сборка падежей для [src.type].")
	src.cases_ru = deepCopyList(blueprint_to_list_ru(case_blueprint_ru))
	setup_initials_ru()
	if(enable_case_logging_ru)
		for(var/case_group in cases_ru)
			if(enable_case_logging_ru) log_grammar_ru("[case_group]: [jointext(list_values(cases_ru[case_group]), ", ")]")
	if(enable_case_reporting_ru) 
		if(!successful_cases_ru.Find(src.type))
			successful_cases_ru += src.type
			log_grammar_ru("Завершена сборка падежей [case_ru(src, GCASE)] (тип [src.type], в.п. [case_ru(src, ACASE)])")

/proc/shortrugender2gender_ru(var/rugender)
	switch(lowertext(rugender))
		if("муж") return MALE
		if("жен") return FEMALE
		if("сред") return NEUTER
		if("множ") return PLURAL
	return

/proc/gender2shortrugender_ru(var/gender)
	switch(lowertext(gender))
		if(MALE) return "муж"
		if(FEMALE) return "жен"
		if(NEUTER) return "сред"
		if(PLURAL) return "множ"
	return

/proc/strip_accent_ru(var/text)
	for(var/accent in strip_accent_map_ru)
		text = replacetext_char(text, accent, strip_accent_map_ru[accent])
	return text

/proc/log_grammar_ru(text)
	WRITE_LOG(grammar_log_ru, "ПАДЕЖИ: [text]")
	for(var/client/C in GLOB.admins)
		to_chat(C, span_filter_debuglogs("ПАДЕЖИ: [text]"))

/datum/proc/update_blueprint_ru(var/left, var/right, var/separator_left = "", var/separator_right = "", var/index = "basic", var/gender)
	
	// this part locates the blueprint from the list index we want
	var/sliced_by_gender
	var/blueprint_index
	if(!case_blueprint_ru || !length(case_blueprint_ru))
		log_grammar_ru("ВНИМАНИЕ: update_blueprint_ru вызван на объекте без шаблона.")
		return // sanity check, no case blueprint
	if(index != "basic")
		log_grammar_ru("update_blueprint_ru: указан индекс, поэтому:")
		for(var/blueprint in case_blueprint_ru)
			log_grammar_ru("Для case_blueprint_ru\[[blueprint]\]:")
			sliced_by_gender = splittext_char(case_blueprint_ru[blueprint], "#")
			log_grammar_ru("spliced_by_gender = [jointext(sliced_by_gender, ", ")]")
			if(!isnull(listgetindex(sliced_by_gender, 3)))
				if(sliced_by_gender[3] == index)
					blueprint_index = blueprint
					break
	else
		sliced_by_gender = splittext_char(case_blueprint_ru[1], "#")

	// this part changes the gender if need be
	var/gender_key
	if(gender) gender_key = gender
	else gender_key = sliced_by_gender[1]

	// this part changes the index if needed
	var/index_key
	if(index) index_key = index
	else if(isnull(listgetindex(sliced_by_gender, 3))) index_key = sliced_by_gender[3]

	if(!blueprint_index) blueprint_index = 1
	var/list/initial_holder = deepCopyList(case_blueprint_initial_ru)
	case_blueprint_ru[blueprint_index] = "[gender_key]#[left][separator_left][sliced_by_gender[2]][separator_right][right][index_key && index_key != "basic"? "#[index_key]" : ""]"
	case_blueprint_initial_ru = deepCopyList(initial_holder)
	construct_cases_ru()
	return