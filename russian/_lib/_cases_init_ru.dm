GLOBAL_LIST_EMPTY(case_repository_ru)

/proc/populate_case_repository_ru()
	var/list/case_repo_lines_ru = file2list("config/case_repository_ru.txt")
	if(!case_repo_lines_ru)
		log_world("Не удалось загрузить репозиторий падежей.")
	else
		for(var/t in case_repo_lines_ru)
			if(!t)
				continue
			t = trim(t)
			if (length_char(t) == 0)
				continue
			else if (copytext_char(t, 1, 2) == "#")
				continue
			var/list/split_lines_ru = splittext_char(t, " = ")
			GLOB.case_repository_ru[split_lines_ru[1]] = split_lines_ru[2]
		log_world("[count_ru(case_repo_lines_ru.len, "Загружен;;о;о", 1)] [count_ru(case_repo_lines_ru.len, "запис;ь;и;ей")] репозитория падежей.")
