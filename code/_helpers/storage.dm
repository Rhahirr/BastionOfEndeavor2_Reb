/proc/create_objects_in_loc(var/atom/loc, var/list/item_paths)
	if(!istype(loc))
		/* Bastion of Endeavor Translation
		CRASH("Inappropriate loction given.")
		*/
		CRASH("Недопустимое расположение.")
		// End of Bastion of Endeavor Translation
	if(!istype(item_paths))
		/* Bastion of Endeavor Translation
		CRASH("Inappropriate item path list given.")
		*/
		CRASH("Недопустимый item_paths.")
		// End of Bastion of Endeavor Translation

	for(var/item_path in item_paths)
		for(var/i = 1 to max(1, item_paths[item_path]))
			new item_path(loc)
