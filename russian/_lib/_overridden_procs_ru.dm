// The following procs are copies of already existing ones with _ru attached.
// Those are needed in order to implement grammar safely one step at a time without breaking things that rely on English.

/proc/dir2text_ru(direction)
	switch (direction)
		if (NORTH)  return "север"
		if (SOUTH)  return "юг"
		if (EAST)  return "восток"
		if (WEST)  return "запад"
		if (NORTHEAST)  return "северо-восток"
		if (SOUTHEAST)  return "юго-восток"
		if (NORTHWEST)  return "северо-запад"
		if (SOUTHWEST)  return "юго-запад"
		if (UP)  return "вверх"
		if (DOWN)  return "вниз"

/proc/text2dir_ru(direction)
	switch (uppertext(direction))
		if ("СЕВЕР")	return 1
		if ("ЮГ")	return 2
		if ("ВОСТОК")	return 4
		if ("ЗАПАД")	return 8
		if ("СЕВЕРО-ВОСТОК") return 5
		if ("СЕВЕРО-ЗАПАД") return 9
		if ("ЮГО-ВОСТОК") return 6
		if ("ЮГО-ЗАПАД") return 10

// Map shenanigans. Please edit it to be more map reliant once map work is done.
/proc/command_name_ru(var/case)
	if(!istype(using_map))
		return
	switch(case)
		if(NCASE) return "Центральное Командование"
		if(GCASE) return "Центрального Командования"
		if(DCASE) return "Центральному Командованию"
		if(ACASE) return "Центральное Командование"
		if(ICASE) return "Центральным Командованием"
		if(PCASE) return "Центральном Командовании"
		else return using_map.boss_name

// Bastion of Endeavor Edit: We need station names under the case too. Bastion of Endeavor TODO: Change this to work with cases once we have map localization.
/proc/station_name_ru(var/case)
	if(!case && using_map.station_name)
		return using_map.station_name
	switch(case)
		// Логистическая станция НаноТрейзен
		if(NCASE) return "ЛС-НТ Южный Крест"
		if(GCASE) return "ЛС-НТ Южный Крест" // we're still deciding if we actually want these under cases
		if(DCASE) return "ЛС-НТ Южный Крест"
		if(ACASE) return "ЛС-НТ Южный Крест"
		if(ICASE) return "ЛС-НТ Южный Крест"
		if(PCASE) return "ЛС-НТ Южный Крест"

/proc/get_genders_ru(var/list/genders)
	if(!islist(genders)) return
	var/list/returning_list = list()
	for(var/gender in genders)
		returning_list += get_key_by_value(all_genders_define_list_ru, gender)
	return returning_list
