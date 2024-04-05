
/client/New()
	..()
	dir = NORTH

/client/verb/spinleft()
	/* Bastion of Endeavor Translation: We dont want this ancient relic here as it breaks a lot of sprites
	set name = "Spin View CCW"
	set category = "OOC"
	*/
	set name = "Повернуть камеру ↻"
	set hidden = TRUE
	// End of Bastion of Endeavor Translation
	dir = turn(dir, 90)

/client/verb/spinright()
	/* Bastion of Endeavor Translation
	set name = "Spin View CW"
	set category = "OOC"
	*/
	set name = "Повернуть камеру ↺"
	set hidden = TRUE
	// End of Bastion of Endeavor Translation
	dir = turn(dir, -90)

