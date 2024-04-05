//
// Bellies subsystem - Process vore bellies
//

PROCESSING_SUBSYSTEM_DEF(bellies)
	/* Bastion of Endeavor Translation
	name = "Bellies"
	*/
	name = "Животы"
	// End of Bastion of Endeavor Translation
	wait = 6 SECONDS
	flags = SS_KEEP_TIMING|SS_NO_INIT
	runlevels = RUNLEVEL_GAME|RUNLEVEL_POSTGAME

/datum/controller/subsystem/processing/bellies/Recover()
	/* Bastion of Endeavor Translation
	log_debug("[name] subsystem Recover().")
	*/
	log_debug("Вызван Recover() подсистемы '[name]'.")
	// End of Bastion of Endeavor Translation
	if(SSbellies.current_thing)
		/* Bastion of Endeavor Translation
		log_debug("current_thing was: (\ref[SSbellies.current_thing])[SSbellies.current_thing]([SSbellies.current_thing.type]) - currentrun: [SSbellies.currentrun.len] vs total: [SSbellies.processing.len]")
		*/
		log_debug("current_thing было: (\ref[SSbellies.current_thing])[SSbellies.current_thing]([SSbellies.current_thing.type]) - currentrun: [SSbellies.currentrun.len] при [SSbellies.processing.len] в общей сложности.")
		// End of Bastion of Endeavor Translation
	var/list/old_processing = SSbellies.processing.Copy()
	for(var/datum/D in old_processing)
		if(!isbelly(D))
			/* Bastion of Endeavor Translation
			log_debug("[name] subsystem Recover() found inappropriate item in list: [D.type]")
			*/
			log_debug("Recover() подсистемы '[name]' обнаружил недопустимый элемент в списке: [D.type].")
			// End of Bastion of Endeavor Translation
		if(CHECK_BITFIELD(D.datum_flags, DF_ISPROCESSING))
			processing |= D
