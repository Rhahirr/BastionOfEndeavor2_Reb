//Fires five times every second.

PROCESSING_SUBSYSTEM_DEF(fastprocess)
	/* Bastion of Endeavor Translation
	name = "Fast Processing"
	*/
	name = "Быстрая обработка"
	// End of Bastion of Endeavor Translation
	wait = 2
	/* Bastion of Endeavor Translation
	stat_tag = "FP"
	*/
	stat_tag = "| Обрабатывается"
	// End of Bastion of Endeavor Translation
	flags = SS_NO_INIT // CHOMPEdit

/datum/controller/subsystem/processing/fastprocess/Recover()
	/* Bastion of Endeavor Translation
	log_debug("[name] subsystem Recover().")
	*/
	log_debug("Вызван Recover() подсистемы '[name]'.")
	// End of Bastion of Endeavor Translation
	if(SSfastprocess.current_thing)
		/* Bastion of Endeavor Translation
		log_debug("current_thing was: (\ref[SSfastprocess.current_thing])[SSfastprocess.current_thing]([SSfastprocess.current_thing.type]) - currentrun: [SSfastprocess.currentrun.len] vs total: [SSfastprocess.processing.len]")
		*/
		log_debug("current_thing было: (\ref[SSfastprocess.current_thing])[SSfastprocess.current_thing]([SSfastprocess.current_thing.type]) - currentrun: [SSfastprocess.currentrun.len] при [SSfastprocess.processing.len] в общей сложности.")
		// End of Bastion of Endeavor Translation
	var/list/old_processing = SSfastprocess.processing.Copy()
	for(var/datum/D in old_processing)
		if(CHECK_BITFIELD(D.datum_flags, DF_ISPROCESSING))
			processing |= D
