// This is basically a copypaste of Spawn + Case Editor + Delete verbs
// this is incredibly convenient for debugging without having to find objects to click on
/client/proc/debug_cases_ru(var/object as text)
	set name = "Проверить падежи"
	set category = "Отладка"
	set desc = "Заспавнить и проверить падежи объекта."
	var/list/types = typesof(/atom)
	var/list/matches = new()
	for(var/path in types)
		if(findtext("[path]", object))
			matches += path
	if(matches.len==0)
		return
	var/chosen
	if(matches.len==1)
		chosen = matches[1]
	else
		chosen = tgui_input_list(usr, "Выберите необходимый атом:", "Проверка падежей", matches)
		if(!chosen)
			return
	var/atom/spawned = new chosen(usr.loc)
	var/msg = "<meta charset=\"UTF-8\">Падежи [chosen]:<HR>"
	msg += "<br>Шаблоны: [spawned.case_blueprint_ru.Join("<br>")]"
	if (spawned.always_plural_ru)
		msg += "<br>Этот атом используется в основном во множественном числе."
	if (spawned.number_lock_ru)
		if (spawned.number_lock_ru == "singular")
			msg += "<br>Этот атом склоняется ТОЛЬКО в единственном числе:"
		if (spawned.number_lock_ru == "plural")
			msg += "<br>Этот атом склоняется ТОЛЬКО во множественном числе:"
		msg += "<br>force_mode = \"normal\": [case_ru(spawned, NCASE)]"
		msg += "<br>force_mode = \"singular\": [case_ru(spawned, NCASE, force_mode = "singular")]"
		msg += "<br>force_mode = \"plural\": [case_ru(spawned, NCASE, force_mode = "plural")]"
	for(var/case_group in spawned.cases_ru)	
		for (var/case in spawned.cases_ru[case_group])
			if(case == RUGENDER)
				msg += "<br>Род: [spawned.cases_ru[case_group][case]]"
				continue
			else if (case == PLURAL_RUGENDER)
				continue
			msg += "<br>[fancy_case_names_ru[case]]: [spawned.cases_ru[case_group][case]]"
	src << browse(msg,"window=debug_cases_item")
	vv_update_display(spawned, "deleted", VV_MSG_DELETED)
	qdel(spawned)
	if(!QDELETED(spawned))
		vv_update_display(spawned, "deleted", "")

/client/add_admin_verbs()
	if(holder)
		// verbs += /client/proc/edit_cases_ru // TODO CODE A PROPER EDITOR
		verbs += /client/proc/debug_cases_ru
		verbs += /client/proc/type2txt_ru
		//verbs += /client/proc/test_case_repository_ru
	..()

/* uncomment if repo reading breaks
/client/proc/test_case_repository_ru()
	set name = "Показать репозиторий падежей"
	set category = "Отладка"
	if(GLOB.case_repository_ru.len == 0)
		to_chat(usr, "Репозиторий пуст!")
	for(var/line in GLOB.case_repository_ru)
		to_chat(usr, "Ключ: [line], шаблон [GLOB.case_repository_ru[line]].")
*/

// the following is a helpful proc that lists out all the name vars of subtypes in a given typepath
// the intended application is to see what types within modules aren't localized yet
/client/proc/type2txt_ru()
	set name = "Вывести названия подтипов"
	set category = "Отладка"
	var/typepath = tgui_input_text(usr, "Введите тип:", "Вывести названия подтипов")
	if(!typepath || ispath(typepath)) return
	var/list/types = typesof(typepath)
	var/dat = "<meta charset=\"UTF-8\">Подтипы [typepath]:<HR>"
	dat += "<body><table border=1 cellspacing=5><B><tr><th>Название</th><th>Тип</th><th>Шаблон</th><th>Род</th><th>И.П</th><th>Р.П</th><th>Д.П</th><th>В.П</th><th>Т.П</th><th>П.П</th><th>number_lock</th><th>always_plural</th></tr></B>"
	for(var/path in types)
		var/atom/item = new path
		if(isnull(item) || isnull(item.cases_ru)) continue
		dat += "<tr><td>[item]</td>" // имя
		dat += "<td>[item.type]</td>" // тип
		dat += "<td>[item.case_blueprint_ru? item.case_blueprint_ru[1] : "<b><span style='color: red;'>НЕТ</span></b>"]</td>" // шаблон
		dat += "<td>[item.cases_ru.len? shortgender2rugender_ru(item.cases_ru["basic"]["rugender"]) : "Нет"]</td>"
		dat += "<td>[ncase_ru(item)]</td>" // и.п
		dat += "<td>[gcase_ru(item)]</td>" // р.п
		dat += "<td>[dcase_ru(item)]</td>" // д.п
		dat += "<td>[acase_ru(item)]</td>" // в.п
		dat += "<td>[icase_ru(item)]</td>" // т.п
		dat += "<td>[pcase_ru(item)]</td>" // п.п
		dat += "<td>[item.number_lock_ru? "[number_lock_ru == "singular"? "Единственное число" : "Множественное число"]"  : "Нет"]</td>" // число
		dat += "<td>[item.always_plural_ru? always_plural_ru : "Нет"]</td></tr>" // мн. ч
		qdel(item)
	dat += "</table></body></html>"
	src << browse(dat,"window=debug_cases_mass")

/proc/shortgender2rugender_ru(var/gender)
	switch(lowertext(gender))
		if(MALE) return "Мужской"
		if(FEMALE) return "Женский"
		if(NEUTER) return "Средний"
		if(PLURAL) return "Множественное число"
	return
