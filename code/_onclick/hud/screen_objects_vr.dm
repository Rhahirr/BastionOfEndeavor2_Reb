/obj/screen/proc/Click_vr(location, control, params)
	if(!usr)	return 1
	switch(name)

		//Shadekin
		/* Bastion of Endeavor Translation
		if("darkness")
		*/
		if("Тьма")
		// End of Bastion of Endeavor Translation
			var/turf/T = get_turf(usr)
			var/darkness = round(1 - T.get_lumcount(),0.1)
			/* Bastion of Endeavor Translation
			to_chat(usr,"<span class='notice'><b>Darkness:</b> [darkness]</span>")
			*/
			to_chat(usr,"<span class='notice'><b>Тьма:</b> [darkness]</span>")
			// End of Bastion of Endeavor Translation
		/* Bastion of Endeavor Translation
		if("energy")
		*/
		if("Энергия")
		// End of Bastion of Endeavor Translation
			var/mob/living/simple_mob/shadekin/SK = usr
			if(istype(SK))
				/* Bastion of Endeavor Translation
				to_chat(usr,"<span class='notice'><b>Energy:</b> [SK.energy] ([SK.dark_gains])</span>")
				*/
				to_chat(usr,"<span class='notice'><b>Энергия:</b> [SK.energy] ([SK.dark_gains])</span>")
				// End of Bastion of Endeavor Translation
		/* Bastion of Endeavor Translation
		if("shadekin status")
		*/
		if("Состояние")
		// End of Bastion of Endeavor Translation
			var/turf/T = get_turf(usr)
			if(T)
				var/darkness = round(1 - T.get_lumcount(),0.1)
				/* Bastion of Endeavor Translation
				to_chat(usr,"<span class='notice'><b>Darkness:</b> [darkness]</span>")
				*/
				to_chat(usr,"<span class='notice'><b>Тьма:</b> [darkness]</span>")
				// End of Bastion of Endeavor Translation
			var/mob/living/carbon/human/H = usr
			if(istype(H) && istype(H.species, /datum/species/shadekin))
				/* Bastion of Endeavor Translation
				to_chat(usr,"<span class='notice'><b>Energy:</b> [H.shadekin_get_energy(H)]</span>")
				*/
				to_chat(usr,"<span class='notice'><b>Энергия:</b> [H.shadekin_get_energy(H)]</span>")
				// End of Bastion of Endeavor Translation
		/* Bastion of Endeavor Translation
		if("danger level")
		*/
		if("Уровень опасности")
		// End of Bastion of Endeavor Translation
			var/mob/living/carbon/human/H = usr
			if(istype(H) && istype(H.species, /datum/species/xenochimera))
				if(H.feral > 50)
					/* Bastion of Endeavor Translation
					to_chat(usr, "<span class='warning'>You are currently <b>completely feral.</b></span>")
					*/
					to_chat(usr, "<span class='warning'>Вы <b>полностью одичали</b>.</span>")
					// End of Bastion of Endeavor Translation
				else if(H.feral > 10)
					/* Bastion of Endeavor Translation
					to_chat(usr, "<span class='warning'>You are currently <b>crazed and confused.</b></span>")
					*/
					to_chat(usr, "<span class='warning'>Вы постепенно <b>начинаете сходить с ума</b>.</span>")
					// End of Bastion of Endeavor Translation
				else if(H.feral > 0)
					/* Bastion of Endeavor Translation
					to_chat(usr, "<span class='warning'>You are currently <b>acting on instinct.</b></span>")
					*/
					to_chat(usr, "<span class='warning'>Вы сейчас <b>полагаетесь на инстинкты</b>.</span>")
					// End of Bastion of Endeavor Translation
				else
					/* Bastion of Endeavor Translation
					to_chat(usr, "<span class='notice'>You are currently <b>calm and collected.</b></span>")
					*/
					to_chat(usr, "<span class='notice'>Вы сейчас <b>полностью спокойны</b>.</span>")
					// End of Bastion of Endeavor Translation
				if(H.feral > 0)
					var/feral_passing = TRUE
					if(H.traumatic_shock > min(60, H.nutrition/10))
						/* Bastion of Endeavor Translation
						to_chat(usr, "<span class='warning'>Your pain prevents you from regaining focus.</span>")
						*/
						to_chat(usr, "<span class='warning'>Боль мешает вам сосредоточиться.</span>")
						// End of Bastion of Endeavor Translation
						feral_passing = FALSE
					if(H.feral + H.nutrition < 150)
						/* Bastion of Endeavor Translation
						to_chat(usr, "<span class='warning'>Your hunger prevents you from regaining focus.</span>")
						*/
						to_chat(usr, "<span class='warning'>Голод мешает вам сосредоточиться.</span>")
						// End of Bastion of Endeavor Translation
						feral_passing = FALSE
					if(H.jitteriness >= 100)
						/* Bastion of Endeavor Translation
						to_chat(usr, "<span class='warning'>Your jitterness prevents you from regaining focus.</span>")
						*/
						to_chat(usr, "<span class='warning'>Дрожь мешает вам сосредоточиться.</span>")
						// End of Bastion of Endeavor Translation
						feral_passing = FALSE
					if(feral_passing)
						var/turf/T = get_turf(H)
						if(T.get_lumcount() <= 0.1)
							/* Bastion of Endeavor Translation
							to_chat(usr, "<span class='notice'>You are slowly calming down in darkness' safety...</span>")
							*/
							to_chat(usr, "<span class='notice'>Вы постепенно успокаиваетесь, находясь в родных объятиях тьмы...</span>")
							// End of Bastion of Endeavor Translation

						else if(isbelly(H.loc)) // Safety message for if inside a belly.
							/* Bastion of Endeavor Translation
							to_chat(usr, "<span class='notice'>You are slowly calming down within the darkness of something's belly, listening to their body as it moves around you. ...safe...</span>")
							*/
							to_chat(usr, "<span class='notice'>Вы постепенно успокиваетесь, находясь во тьме в чьём-то животе и слыша, как тело движется вокруг вас.. Вы в безопасности.</span>")
							// End of Bastion of Endeavor Translation
						else
							/* Bastion of Endeavor Translation
							to_chat(usr, "<span class='notice'>You are slowly calming down... But safety of darkness is much preferred.</span>")
							*/
							to_chat(usr, "<span class='notice'>Вы постепенно успокаиваетесь... но вам хочется обратно во тьму.</span>")
							// End of Bastion of Endeavor Translation
				else
					if(H.nutrition < 150)
						/* Bastion of Endeavor Translation
						to_chat(usr, "<span class='warning'>Your hunger is slowly making you unstable.</span>")
						*/
						to_chat(usr, "<span class='warning'>Голод постепенно доводит вас до неуравновешенности.</span>")
						// End of Bastion of Endeavor Translation
		/* Bastion of Endeavor Translation
		if("Reconstructing Form") // Allow Viewing Reconstruction Timer + Hatching for 'chimera
		*/
		if("Воссоздание формы")
		// End of Bastion of Endeavor Translation
			var/mob/living/carbon/human/H = usr
			if(istype(H) && istype(H.species, /datum/species/xenochimera)) // If you're somehow able to click this while not a chimera, this should prevent weird runtimes. Will need changing if regeneration is ever opened to non-chimera using the same alert.
				if(H.revive_ready == REVIVING_NOW)
					/* Bastion of Endeavor Translation
					to_chat(usr, "<span class='notice'>We are currently reviving, and will be done in [round((H.revive_finished - world.time) / 10)] seconds, or [round(((H.revive_finished - world.time) * 0.1) / 60)] minutes.</span>")
					*/
					to_chat(usr, "<span class='notice'>Мы в процессе возрождения и закончим только через [count_ru(round((H.revive_finished - world.time) / 10), "секунд;у;ы;")] ([count_ru(round(((H.revive_finished - world.time) * 0.1) / 60), "минут;у;ы;")]).</span>")
					// End of Bastion of Endeavor Translation
				else if(H.revive_ready == REVIVING_DONE)
					/* Bastion of Endeavor Translation
					to_chat(usr, "<span class='warning'>You should have a notification + alert for this! Bug report that this is still here!</span>")
					*/
					to_chat(usr, "<span class='warning'>Возрождение должно сопровождаться уведомлением и иконкой! Доложите об этом баге!</span>")
					// End of Bastion of Endeavor Translation
					
		/* Bastion of Endeavor Translation
		if("Ready to Hatch") // Allow Viewing Reconstruction Timer + Hatching for 'chimera
		*/
		if("Готовность вылупиться")
		// End of Bastion of Endeavor Translation
			var/mob/living/carbon/human/H = usr
			if(istype(H) && istype(H.species, /datum/species/xenochimera)) // If you're somehow able to click this while not a chimera, this should prevent weird runtimes. Will need changing if regeneration is ever opened to non-chimera using the same alert.
				if(H.revive_ready == REVIVING_DONE) // Sanity check.
					H.hatch() // Hatch.

		else
			return 0

	return 1
