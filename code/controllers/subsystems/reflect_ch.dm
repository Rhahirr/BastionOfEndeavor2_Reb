#define FIRE_PRIORITY_REFLECTOR 20

SUBSYSTEM_DEF(reflector)
	/* Bastion of Endeavor Translation
	name = "Reflectors"
	*/
	name = "Отражатели"
	// End of Bastion of Endeavor Translation
	priority = FIRE_PRIORITY_REFLECTOR
	flags = SS_BACKGROUND | SS_NO_INIT
	wait = 5

	/* Bastion of Endeavor Translation
	var/stat_tag = "R" //Used for logging
	*/
	var/stat_tag = "| Обрабатывается" //Used for logging
	// End of Bastion of Endeavor Translation
	var/list/processing = list()
	var/list/currentrun = list()
	var/process_proc = /datum/proc/process

	var/obj/structure/reflector/current_thing

/datum/controller/subsystem/reflector/Recover()
	/* Bastion of Endeavor Translation
	log_debug("[name] subsystem Recover().")
	*/
	log_debug("Вызван Recover() подсистемы [name].")
	// End of Bastion of Endeavor Translation
	if(SSreflector.current_thing)
		/* Bastion of Endeavor Translation
		log_debug("current_thing was: (\ref[SSreflector.current_thing])[SSreflector.current_thing]([SSreflector.current_thing.type]) - currentrun: [SSreflector.currentrun.len] vs total: [SSreflector.processing.len]")
		*/
		log_debug("current_thing: (\ref[SSreflector.current_thing])[SSreflector.current_thing]([SSreflector.current_thing.type]) - currentrun: [SSreflector.currentrun.len] против [SSreflector.processing.len] в общей сложности.")
		// End of Bastion of Endeavor Translation
	var/list/old_processing = SSreflector.processing.Copy()
	for(var/datum/D in old_processing)
		if(CHECK_BITFIELD(D.datum_flags, DF_ISPROCESSING))
			processing |= D

//CHOMPEdit Begin
/datum/controller/subsystem/reflector/stat_entry(msg)
	/* Bastion of Endeavor Translation: Yeah
	msg = "[stat_tag]:[processing.len]"
	*/
	msg = "[stat_tag]: [processing.len]"
	// End of Bastion of Endeavor Translation
	return ..()
// CHOMPEdit End

/datum/controller/subsystem/reflector/fire(resumed = 0)
	if (!resumed)
		currentrun = processing.Copy()
	//cache for sanic speed (lists are references anyways)
	var/list/current_run = currentrun

	while(current_run.len)
		current_thing = current_run[current_run.len]
		current_run.len--
		if(QDELETED(current_thing))
			processing -= current_thing
		current_thing.Fire()
		if (MC_TICK_CHECK)
			current_thing = null
			return

	current_thing = null

#undef FIRE_PRIORITY_REFLECTOR
