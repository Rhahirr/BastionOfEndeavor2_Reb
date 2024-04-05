/datum/spawnpoint/stationgateway
	/* Bastion of Endeavor Translation
	display_name = "Station gateway"
	msg = "has completed translation from station gateway"
	*/
	display_name = "Станционный телепорт"
	msg = "прибыл;;а;о;и; на станцию с помощью станционного телепорта"
	// End of Bastion of Endeavor Translation
	disallow_job = list(JOB_OUTSIDER)

/datum/spawnpoint/stationgateway/New()
	..()
	turfs = GLOB.latejoin_gatewaystation

/datum/spawnpoint/vore
	/* Bastion of Endeavor Translation
	display_name = "Vorespawn - Prey"
	msg = "has arrived on the station"
	*/
	display_name = "Появление с помощью Vore – Жертва"
	msg = "прибыл;;а;о;и; на станцию"
	// End of Bastion of Endeavor Translation
	allow_offmap_spawn = TRUE

/datum/spawnpoint/vore/pred
	/* Bastion of Endeavor Translation
	display_name = "Vorespawn - Pred"
	msg = "has arrived on the station"
	*/
	display_name = "Появление с помощью Vore – Хищник"
	msg = "прибыл;;а;о;и; на станцию"
	// End of Bastion of Endeavor Translation

/datum/spawnpoint/vore/itemtf
	/* Bastion of Endeavor Translation
	display_name = "Item TF spawn"
	msg = "has arrived on the station"
	*/
	display_name = "Появление в качестве предмета"
	msg = "прибыл;;а;о;и; на станцию"
	// End of Bastion of Endeavor Translation

/datum/spawnpoint/vore/New()
	..()
	turfs = latejoin

/datum/spawnpoint/plainspath
	/* Bastion of Endeavor Translation
	display_name = "Sif plains"
	msg = "has checked in at the plains gate"
	*/
	display_name = "Равнина на Сифе"
	msg = "отметил;ся;ась;ось;ись; у равнинных ворот"
	// End of Bastion of Endeavor Translation
	restrict_job = list(JOB_OUTSIDER, JOB_ANOMALY)

/datum/spawnpoint/plainspath/New()
	..()
	turfs = GLOB.latejoin_plainspath
