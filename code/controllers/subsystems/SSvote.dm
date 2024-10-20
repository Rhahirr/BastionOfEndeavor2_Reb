SUBSYSTEM_DEF(vote)
	/* Bastion of Endeavor Translation
	name = "Vote"
	*/
	name = "Голосования"
	// End of Bastion of Endeavor Translation
	wait = 10
	priority = FIRE_PRIORITY_VOTE
	runlevels = RUNLEVEL_LOBBY | RUNLEVELS_DEFAULT
	flags = SS_KEEP_TIMING | SS_NO_INIT

	var/datum/vote/active_vote

/datum/controller/subsystem/vote/fire()
	if(active_vote)
		active_vote.tick()

/datum/controller/subsystem/vote/proc/start_vote(datum/vote/V)
	active_vote = V
	active_vote.start()
