// Returns the lowest turf available on a given Z-level, defaults to asteroid for Polaris.

/proc/get_base_turf(var/z)
	if(!using_map.base_turf_by_z["[z]"])
		using_map.base_turf_by_z["[z]"] = /turf/space
	return using_map.base_turf_by_z["[z]"]

//An area can override the z-level base turf, so our solar array areas etc. can be space-based.
/proc/get_base_turf_by_area(var/turf/T)
	var/area/A = T.loc
	if(A.base_turf)
		return A.base_turf
	return get_base_turf(T.z)

/client/proc/set_base_turf()
	/* Bastion of Endeavor Translation
	set category = "Debug"
	set name = "Set Base Turf"
	set desc = "Set the base turf for a z-level."
	*/
	set category = "Отладка"
	set name = "Установить основной тюрф"
	set desc = "Установить основной тюрф для Z-уровня."
	// End of Bastion of Endeavor Translation

	if(!holder)	return

	/* Bastion of Endeavor Translation
	var/choice = tgui_input_number(usr, "Which Z-level do you wish to set the base turf for?")
	*/
	var/choice = tgui_input_number(usr, "Для какого Z-уровня вы хотите установить основной тюрф?")
	// End of Bastion of Endeavor Translation
	if(!choice)
		return

	/* Bastion of Endeavor Translation
	var/new_base_path = tgui_input_list(usr, "Please select a turf path (cancel to reset to /turf/space).", "Set Base Turf", typesof(/turf))
	*/
	var/new_base_path = tgui_input_list(usr, "Выберите путь к тюрфу (нажмите Отмена, чтобы сбросить до /turf/space).", "Установить основной тюрф", typesof(/turf))
	// End of Bastion of Endeavor Translation
	if(!new_base_path)
		new_base_path = /turf/space
	using_map.base_turf_by_z["[choice]"] = new_base_path
	/* Bastion of Endeavor Translation
	message_admins("[key_name_admin(usr)] has set the base turf for z-level [choice] to [get_base_turf(choice)].")
	log_admin("[key_name(usr)] has set the base turf for z-level [choice] to [get_base_turf(choice)].")
	*/
	message_admins("[key_name_admin(usr)] установил основной тюрф Z-уровня [choice] на [get_base_turf(choice)].")
	log_admin("[key_name(usr)] установил основной тюрф Z-уровня [choice] на [get_base_turf(choice)].")
	// End of Bastion of Endeavor Translation