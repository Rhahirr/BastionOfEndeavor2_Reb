/datum/preferences
	var/show_in_directory = 1	//Show in Character Directory
	/* Bastion of Endeavor Translation
	var/directory_tag = "Unset" //Sorting tag to use in character directory
	var/directory_erptag = "Unset"	//ditto, but for non-vore scenes
	// CHOMPStation Edit Start: Directory Update
	var/directory_gendertag = "Unset" // Gender stuff!
	var/directory_sexualitytag = "Unset" // Sexuality!
	*/
	var/directory_tag = "Не указано"
	var/directory_erptag = "Не указано"
	var/directory_gendertag = "Не указано"
	var/directory_sexualitytag = "Не указано"
	// End of Bastion of Endeavor Translation
	// CHOMPStation Edit End: Directory Update
	var/directory_ad = ""		//Advertisement stuff to show in character directory.
	var/sensorpref = 5			//Set character's suit sensor level
	var/capture_crystal = 1	//Whether or not someone is able to be caught with capture crystals
	var/auto_backup_implant = FALSE //Whether someone starts with a backup implant or not.
	var/borg_petting = TRUE //Whether someone can be petted as a borg or not.
	var/stomach_vision = TRUE //Whether or not someone can view stomach sprites

	var/job_talon_high = 0
	var/job_talon_med = 0
	var/job_talon_low = 0

//Why weren't these in game toggles already?
/client/verb/toggle_capture_crystal()
	/* Bastion of Endeavor Translation
	set name = "Toggle Catchable"
	set category = "Preferences.Character" //CHOMPEdit
	set desc = "Toggles being catchable with capture crystals."
	*/
	set name = "Отлавливаемость кристаллами"
	set category = "Предпочтения.Персонаж"
	set desc = "Разрешить или запретить заключение вашего персонажа в кристаллы."
	// End of Bastion of Endeavor Translation

	var/mob/living/L = mob

	if(prefs.capture_crystal)
		/* Bastion of Endeavor Translation
		to_chat(src, "You are no longer catchable.")
		*/
		to_chat(src, "Вас теперь нельзя заключить в кристалл.")
		// End of Bastion of Endeavor Translation
		prefs.capture_crystal = 0
	else
		/* Bastion of Endeavor Translation
		to_chat(src, "You are now catchable.")
		*/
		to_chat(src, "Вас теперь можно заключить в кристалл.")
		// End of Bastion of Endeavor Translation
		prefs.capture_crystal = 1
	if(L && istype(L))
		L.capture_crystal = prefs.capture_crystal
	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TCaptureCrystal") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
