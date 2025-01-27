SUBSYSTEM_DEF(orbit)
	/* Bastion of Endeavor Translation
	name = "Orbits"
	*/
	name = "Орбиты"
	// End of Bastion of Endeavor Translation
	priority = FIRE_PRIORITY_ORBIT
	wait = 2
	flags = SS_NO_INIT|SS_TICKER

	var/list/currentrun = list()
	var/list/processing = list()

/datum/controller/subsystem/orbit/stat_entry(msg)
	/* Bastion of Endeavor Translation
	msg = "P:[processing.len]"
	*/
	msg = "| Обрабатывается: [processing.len]"
	// End of Bastion of Endeavor Translation
	return ..()


/datum/controller/subsystem/orbit/fire(resumed = 0)
	if (!resumed)
		src.currentrun = processing.Copy()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while (currentrun.len)
		var/datum/orbit/O = currentrun[currentrun.len]
		currentrun.len--
		if (!O)
			processing -= O
			if (MC_TICK_CHECK)
				return
			continue
		if (!O.orbiter)
			qdel(O)
			if (MC_TICK_CHECK)
				return
			continue
		if (O.lastprocess >= world.time) //we already checked recently
			if (MC_TICK_CHECK)
				return
			continue
		var/targetloc = get_turf(O.orbiting)
		if (targetloc != O.lastloc || O.orbiter.loc != targetloc)
			O.Check(targetloc)
		if (MC_TICK_CHECK)
			return
