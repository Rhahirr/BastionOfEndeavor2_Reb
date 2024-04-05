PROCESSING_SUBSYSTEM_DEF(obj)
	/* Bastion of Endeavor Translation
	name = "Objects"
	*/
	name = "Объекты"
	// End of Bastion of Endeavor Translation
	priority = FIRE_PRIORITY_OBJ
	flags = SS_NO_INIT
	wait = 20

/datum/controller/subsystem/processing/obj/Recover()
	/* Bastion of Endeavor Translation
	log_debug("[name] subsystem Recover().")
	*/
	log_debug("Вызван Recover() подсистемы '[name]'.")
	// End of Bastion of Endeavor Translation
	if(SSobj.current_thing)
		/* Bastion of Endeavor Translation
		log_debug("current_thing was: (\ref[SSobj.current_thing])[SSobj.current_thing]([SSobj.current_thing.type]) - currentrun: [SSobj.currentrun.len] vs total: [SSobj.processing.len]")
		*/
		log_debug("current_thing было: (\ref[SSobj.current_thing])[SSobj.current_thing]([SSobj.current_thing.type]) - currentrun: [SSobj.currentrun.len] при [SSobj.processing.len] в общей сложности.")
		// End of Bastion of Endeavor Translation
	var/list/old_processing = SSobj.processing.Copy()
	for(var/datum/D in old_processing)
		if(!isobj(D))
			/* Bastion of Endeavor Translation
			log_debug("[name] subsystem Recover() found inappropriate item in list: [D.type]")
			*/
			log_debug("Recover() подсистемы '[name]' обнаружил недопустимый элемент в списке: [D.type].")
			// End of Bastion of Endeavor Translation
		if(CHECK_BITFIELD(D.datum_flags, DF_ISPROCESSING))
			processing |= D