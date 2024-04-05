// clearly our code isn't laggy enough

/datum
	var/list/cases_initial_ru
	var/list/case_blueprint_initial_ru
	var/initialized_ru

/proc/initial_ru(atom/input, case = "case", self_check = null, secondary = null, force_mode="normal", is_initial = TRUE)
	if(!input.cases_initial_ru.len)
		is_initial = FALSE
		log_grammar_ru("Внимание: попытка вызвать начальное значение склонения без инициализации.")
	return case_ru(input, case, self_check, secondary, force_mode, is_initial)

/datum/proc/setup_initials_ru()
	if(!initialized_ru)
		case_blueprint_initial_ru = case_blueprint_ru
		cases_initial_ru = blueprint_to_list_ru(case_blueprint_initial_ru)
		initialized_ru = 1

/datum/proc/restore_initials_ru(secondary = "basic", full_restore = FALSE)
	if(full_restore)
		cases_ru = deepCopyList(cases_initial_ru)
		case_blueprint_ru = deepCopyList(case_blueprint_initial_ru)
	else
		cases_ru[secondary] = cases_initial_ru[secondary]
		case_blueprint_ru = deepCopyList(case_blueprint_initial_ru) // Bastion of Endeavor TODO: too lazy to make it correct a specific blueprint by secondary
	return

// i'm not sure if its okay for it to be an atom proc but the name straight up cannot be changed otherwise
/atom/proc/update_initials_ru(var/left, var/right, var/separator_left = "", var/separator_right = "", var/index = "basic", var/gender, var/case = "case", var/self_check = null, var/secondary = null, var/force_mode="normal", var/is_initial, full_restore = FALSE)
	restore_initials_ru(secondary)
	update_blueprint_ru(left, right, separator_left, separator_right, secondary, gender)
	name = cap_ru(src)