/client/proc/pingfromtime(time)
	return ((world.time+world.tick_lag*world.tick_usage/100)-time)*100

/client/verb/display_ping(time as num)
	set instant = TRUE
	set name = ".display_ping"
	/* Bastion of Endeavor Translation
	to_chat(src, span_notice("Round trip ping took [round(pingfromtime(time),1)]ms"))
	*/
	to_chat(src, span_notice("Пинг составляет [round(pingfromtime(time),1)] мс."))
	// End of Bastion of Endeavor Translation

/client/verb/ping()
	/* Bastion of Endeavor Translation
	set name = "Ping"
	set category = "OOC.Debug" //CHOMPEdit
	*/
	set name = "Пинг"
	set category = "OOC.Отладка"
	// End of Bastion of Endeavor Translation
	winset(src, null, "command=.display_ping+[world.time+world.tick_lag*world.tick_usage/100]") 
