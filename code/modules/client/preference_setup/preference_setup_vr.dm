//Minimum limit is 18
/datum/category_item/player_setup_item/get_min_age()
	var/min_age = 18
	/* Bastion of Endeavor Translation: Bastion of Endeavor TODO: Might need to be rolled back depending on how species localization goes
	var/datum/species/S = GLOB.all_species[pref.species ? pref.species : "Human"]
	*/
	var/datum/species/S = GLOB.all_species[pref.species ? pref.species : SPECIES_HUMAN]
	// End of Bastion of Endeavor Translation
	if(!is_FBP() && S.min_age > 18)
		min_age = S.min_age
	return min_age
