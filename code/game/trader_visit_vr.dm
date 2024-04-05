GLOBAL_VAR(trader_loaded)

/proc/consider_trader_load()
	if(!GLOB.trader_loaded)
		GLOB.trader_loaded = TRUE
		/* Bastion of Endeavor Translation
		var/datum/map_template/MT = SSmapping.map_templates["Special Area - Salamander Trader"] //was: "Special Area - Trader"
		*/
		var/datum/map_template/MT = SSmapping.map_templates["Особая область – Торговое судно"]
		// End of Bastion of Endeavor Translation
		if(!istype(MT))
			/* Bastion of Endeavor Translation
			error("Trader is not a valid map template!")
			*/
			error("Зона торгового шаттла не является допустимым шаблоном карты!")
			// End of Bastion of Endeavor Translation
		else
			MT.load_new_z(centered = TRUE)
			/* Bastion of Endeavor Translation
			log_and_message_admins("Loaded the trade shuttle just now.")
			 */
			log_and_message_admins("Только что был загружен торговый шаттл.")
			// End of Bastion of Endeavor Translation