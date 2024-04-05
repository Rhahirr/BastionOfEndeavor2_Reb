// This is a simple ticker for the new event system.
// The logic that determines what events get chosen is held inside a seperate subsystem.

SUBSYSTEM_DEF(event_ticker)
	/* Bastion of Endeavor Translation
	name = "Events (Ticker)"
	*/
	name = "События (тикер)"
	// End of Bastion of Endeavor Translation
	wait = 2 SECONDS
	runlevels = RUNLEVEL_GAME

	// List of `/datum/event2/event`s that are currently active, and receiving process() ticks.
	var/list/active_events = list()

	// List of `/datum/event2/event`s that finished, and are here for showing at roundend, if that's desired.
	var/list/finished_events = list()

// Process active events.
/datum/controller/subsystem/event_ticker/fire(resumed)
	for(var/datum/event2/event/event as anything in active_events)
		event.process()
		if(event.finished)
			event_finished(event)

// Starts an event, independent of the GM system.
// This means it will always run, and won't affect the GM system in any way, e.g. not putting the event off limits after one use.
/datum/controller/subsystem/event_ticker/proc/start_event(event_type)
	var/datum/event2/event/E = new event_type()
	E.execute()
	event_started(E)

/datum/controller/subsystem/event_ticker/proc/event_started(datum/event2/event/E)
	/* Bastion of Endeavor Translation
	log_debug("Event [E.type] is now being ran.")
	*/
	log_debug("Начинается событие '[E.type]'.")
	// End of Bastion of Endeavor Translation
	active_events += E

/datum/controller/subsystem/event_ticker/proc/event_finished(datum/event2/event/E)
	/* Bastion of Endeavor Translation
	log_debug("Event [E.type] has finished.")
	*/
	log_debug("Событие '[E.type]' завершено.")
	// End of Bastion of Endeavor Translation
	active_events -= E
	finished_events += E