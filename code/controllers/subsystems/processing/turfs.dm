PROCESSING_SUBSYSTEM_DEF(turfs)
	/* Bastion of Endeavor Translation
	name = "Turf Processing"
	*/
	name = "Обработка тюрфов"
	// End of Bastion of Endeavor Translation
	wait = 20
	flags = SS_NO_INIT // CHOMPEdit

/datum/controller/subsystem/processing/turfs/Recover()
	/* Bastion of Endeavor Translation
	log_debug("[name] subsystem Recover().")
	*/
	log_debug("Вызван Recover() подсистемы '[name]'.")
	// End of Bastion of Endeavor Translation
	if(SSturfs.current_thing)
		/* Bastion of Endeavor Translation
		log_debug("current_thing was: (\ref[SSturfs.current_thing])[SSturfs.current_thing]([SSturfs.current_thing.type]) - currentrun: [SSturfs.currentrun.len] vs total: [SSturfs.processing.len]")
		*/
		log_debug("current_thing было: (\ref[SSturfs.current_thing])[SSturfs.current_thing]([SSturfs.current_thing.type]) - currentrun: [SSturfs.currentrun.len] при [SSturfs.processing.len] в общей сложности.")
		// End of Bastion of Endeavor Translation
	var/list/old_processing = SSturfs.processing.Copy()
	for(var/datum/D in old_processing)
		if(!isturf(D))
			/* Bastion of Endeavor Translation
			log_debug("[name] subsystem Recover() found inappropriate item in list: [D.type]")
			*/
			log_debug("Recover() подсистемы '[name]' обнаружил недопустимый элемент в списке: [D.type].")
			// End of Bastion of Endeavor Translation
		if(CHECK_BITFIELD(D.datum_flags, DF_ISPROCESSING))
			processing |= D
