SUBSYSTEM_DEF(sun)
	/* Bastion of Endeavor Translation
	name = "Sun"
	*/
	name = "Солнце"
	// End of Bastion of Endeavor Translation
	wait = 600
	flags = SS_NO_INIT // CHOMPEdit
	var/static/datum/sun/sun = new

/datum/controller/subsystem/sun/fire()
	sun.calc_position()
