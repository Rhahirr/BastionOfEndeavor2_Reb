/atom/movable/proc/Bump_vr(var/atom/A, yes)
	return

/atom/movable/vv_get_dropdown()
	. = ..()
	/* Bastion of Endeavor Translation
	VV_DROPDOWN_OPTION("move_atom", "Move To Coordinate")
	*/
	VV_DROPDOWN_OPTION("move_atom", "Переместить на координаты")
	// End of Bastion of Endeavor Translation

/atom/vv_do_topic(list/href_list)
	. = ..()
	IF_VV_OPTION("move_atom")
		usr.client.cmd_admin_move_atom(src)
		href_list["datumrefresh"] = "\ref[src]"
