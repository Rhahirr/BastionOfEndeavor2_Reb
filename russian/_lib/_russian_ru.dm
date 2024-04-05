// The following code is where most of the grammar magic happens.

/world
	name = "Bastion of Endeavor - RU/18+/HRP/PB"

// Cases are needed for proper russian grammar in the game. Added as a list that can be freely expanded.
// This only seems to work with New(), which is alright but might turn into a mess when used with decls.
// This list by itself, however, is a helpful way of having all atoms and datums carry all information that is relevant to russian grammar.

/area
	var/prep_override_ru = FALSE // This allows us to have different prepositions for areas. ON the deck, IN the room, etc.
	var/area_fancy_name_ru // This is a WIP that will let us have shorter area names that can be used for APCs and such.

// Certain datums need cases too.
// Reagents want to have cases, but will default to "glass of something".
///datum/reagent
//	cases_ru = new /list()

/datum/reagent/New()
	..()
	case_blueprint_ru += "муж#стакан;n1a с чем-то#glass"

/obj/item/weapon/reagent_containers/food/snacks
	var/foodtype_ru // Handles the appropriate verb for various types of meals.

/obj/effect/decal/cleanable/blood/New()
	..()
	case_blueprint_ru += "жен#засохш;adj4aX кро;n8e#dry"

// Work in progress, but it is likely that seeds are going to need this.
/datum/seed
	cases_ru = new /list()

/decl/flooring
	cases_ru = new /list()

/decl/xgm_gas
	cases_ru = new /list()

/datum/preferences
	var/list/cases = list()
	/// var/list/case_blueprint_ru = list()

// Alright, so. This is going to be absolutely atrocious, but for the sake of looking polished in Russian, this must all be done.
// The following code gives the supply packs a specific var that will be tossed into the cases of the crate itself.
/datum/supply_pack
	cases_ru = new /list() // The cases to be used when interacting with the datum itself.
	var/supply_pack_name_ru // This is likely to only ever be under the genitive case!

// Should the worst happen and the need to override the template arises, all of this should be safe to override with New().
// Bastion of Endeavor TODO: No idea if this breaks things or not but come back to this when localizing cargo
/datum/supply_pack/New()
	..()
	case_blueprint_ru += "муж#ящик;n3a от [supply_pack_name_ru]#containername"
	containername = "Ящик от [supply_pack_name_ru]"

// This proc handles the appropriate numeral word depending on the, well, number.
/proc/count_ru(var/input, var/word, var/override = FALSE)
	if(istype(input, /list))
		var/list/input_list = input
		input = input_list.len
	var/output = "[override? "" : "[input] "]"
	var/list/endings_list = splittext_char(word, ";")
	output += endings_list[1]
	if(endings_list.len != 4)
		log_grammar_ru("ОШИБКА: Ввод count_ru не соответствует шаблону! Ввод: [input] [word], проверка выдала [endings_list.len].")
		error("ОШИБКА: Ввод count_ru не соответствует шаблону! Ввод: [input] [word], проверка выдала [endings_list.len].")
		return output
	if(findtext_char(num2text(input), ".")) 					// if its a floating number
		return "[output][endings_list[3]]" 						// then apparently we dont bother with it because russian makes no sense
	var/a = round(input) % 100
	var/b = text2num(copytext_char(num2text(input), -1, 0)) 	// kinda ugly but we want that floating point
	if (a > 10 && a < 20) return "[output][endings_list[4]]"
	if (b > 1 && b < 5) return "[output][endings_list[3]]"
	if (b == 1) return "[output][endings_list[2]]"
	return "[output][endings_list[4]]"

// Dispenses an appropriately formatted string depending on the material and what it's used on.
/* Commented out until materials are localized, the proc needs adjustments after the refactor but the basic idea is there.
/datum/material
	var/case_override_ru // Case override handles the order of words in material stacks. By default, Material + Sheet. If set to TRUE, Sheet of Material.
	var/name_override_ru // Required for other objects made with materials. Glass Table (by default), Table of Reinforced Glass (custom).

/datum/material/New()
	case_blueprint_ru += "муж#лист;n1b#sheet"

/proc/matadj_ru(datum/material, case = "case", gender = "gender", input = "", pre = " из ")
	var/datum/material/mat = material
	var/adjective = ""
	adjective = mat.cases_ru["adj_[gender]"][case]
	if(mat.name_override_ru) return "[input][pre]" + mat.cases_ru["display_name"][GCASE]
	else return "[adjective][(input)? " [input]" : ""]"
*/

// The following proc adjusts a preposition to be used before a word. The list of consonants is provided for this very cause.
var/global/list/consonants_ru = list("б", "в", "г", "д", "ж", "з", "й", "к", "л", "м", "н", "п", "р", "с", "т", "ф", "х", "ц", "ч", "ш", "щ")

/proc/prep_ru(atom/input, var/preposition = "")
	var/first_letter = lowertext(copytext_char(ncase_ru(input), 1, 2))
	var/second_letter = lowertext(copytext_char(ncase_ru(input), 2, 3))
	var/is_capital = FALSE
	if((preposition == "С") || preposition == "В")
		is_capital = TRUE
	switch(lowertext(preposition))
		if("с")
			var/list/c_letter = list("с", "ж", "з", "ш", "л", "р", "м", "в", "щ")
			for(var/let_s in c_letter)
				if (first_letter == "щ") return "[is_capital? "Со" : "со"]"
				else if (first_letter == let_s)
					for(var/cons_s in consonants_ru)
						if (second_letter == cons_s) return "[is_capital? "Со" : "со"]"
			return "[is_capital? "С" : "с"]"
		if("в")
			var/list/v_letter = list("в", "ф")
			for(var/let_v in v_letter)
				if (first_letter == let_v)
					for(var/cons_v in consonants_ru)
						if (second_letter == cons_v) return "[is_capital? "Во" : "в"]"
			return "[is_capital? "В" : "в"]"
		else
			log_grammar_ru("ОШИБКА: Проку prep_ru передан недопустимый предлог: [preposition].")
			error("Проку prep_ru передан недопустимый предлог: [preposition].")
			return "[is_capital? "[capitalize(preposition)]" : "[preposition]"]"

// Basically a better prep_ru
/proc/prep_adv_ru(var/preposition = "", atom/input, var/case = PCASE)
	return "[prep_ru(input, preposition)] [case_ru(input, case)]"

// This is a simple proc that adds an apropriate ending to a verb depending on the user's gender. This is core.
/proc/gender_ru(input, base_verb = "", he_end = "", she_end = "а", it_end = "о", they_end = "и", index="basic")
	var/gender_key = "male"
	if(istype(input, /mob/living/carbon/human))
		var/mob/user = input
		var/datum/gender/user_gender = gender_datums[user.get_visible_gender()]
		gender_key = user_gender.key
	else if (istype(input, /atom))
		var/atom/A = input
		if(A.number_lock_ru == "plural")
			gender_key = "plural"
		else
			if(listgetindex(A.cases_ru, index))	gender_key = A.cases_ru[index][RUGENDER]
			else if(A.case_blueprint_ru) gender_key = A.cases_ru["basic"][RUGENDER]
			else gender_key = "male"
	switch(lowertext(gender_key))
		if("male") return "[base_verb][he_end]"
		if("female") return "[base_verb][she_end]"
		if("neuter") return "[base_verb][it_end]"
		if("plural") return "[base_verb][they_end]"
	return "[base_verb][he_end]"

// An updated version of gender_ru that helps handle hardcoded messages, e.g. arrivals/cryo announcements and attack verbs.
// Largely a copypaste of verb_adv_ru with the target removed. Meant to be used in the procs below.
/proc/verb_ru(var/atom/verb_user, var/input, var/index_v = "basic")
	var/list/message_list = splittext_char(input, ";")
	if(message_list.len == 1)
		message_list = verb_macro_ru(input, message_list)
		return "[gender_ru(verb_user, input, index = index_v)]" // If the template is omitted, use the default verb endings.
	if(message_list.len < 5)
		log_grammar_ru("ОШИБКА: Глагол verb_ru не соответствует шаблону! Ввод: [input], проверка выдала [message_list.len].")
		error("Глагол verb_ru не соответствует шаблону! Ввод: [input], проверка выдала [message_list.len].")
		return message_list[1]
	return "[gender_ru(verb_user, message_list[1], message_list[2], message_list[3], message_list[4], message_list[5], index_v)][message_list[6]]"

/proc/verb_macro_ru(var/input_verb, var/list/input_list)
	switch(lowertext(input_verb))
		if("его") input_list = list("", "его", "её", "его", "их", "")
		if("него") input_list = list("", "него", "неё", "него", "них", "")
		if("им") input_list = list("", "им", "ей", "им", "ими", "")
		if("ним") input_list = list("", "ним", "ней", "ним", "ними", "")
		if("нём") input_list = list("", "нём", "ней", "нём", "них", "")
		if("ему") input_list = list("", "ему", "ей", "ему", "им", "")
		if("нему") input_list = list("", "нему", "ней", "нему", "ним", "")
		if("свой") input_list = list("сво", "й", "ю", "й", "и", "") // this is strictly acase!
	var/self
	if(copytext_char(lowertext(input_verb), -2) == "ся")
		input_list[1] = copytext_char(input_list[1], length_char(input_list[1])-2)
		self = TRUE
	switch(copytext_char(lowertext(input_verb), -2))
		if("ал")
			if(self) input_list.Add("ся", "ась", "ось", "ись", "")
			else input_list.Add("", "а", "о", "и", "")
		if("ел")
			if(self) input_list.Add("ся", "ась", "ось", "ись", "")
			else input_list.Add("", "а", "о", "и", "")
		if("ял")
			if(self) input_list.Add("ся", "ась", "ось", "ись", "")
			else input_list.Add("", "а", "о", "и", "")
		if("ан") input_list.Add("", "а", "о", "ы", "")
		if("ет")
			input_list[1] = copytext_char(input_list[1], length_char(input_list[1])-2)
			input_list.Add("ет", "ет", "ет", "ют", "[self? "ся" : ""]")
		if("ёт")
			input_list[1] = copytext_char(input_list[1], length_char(input_list[1])-2)
			input_list.Add("ёт", "ёт", "ёт", "ут", "[self? "ся" : ""]")
		if("ит")
			input_list[1] = copytext_char(input_list[1], length_char(input_list[1])-2)
			input_list.Add("ит", "ит", "ит", "ят", "[self? "ся" : ""]")
		if("ён")
			input_list[1] = copytext_char(input_list[1], length_char(input_list[1])-2)
			input_list.Add("ён", "ена", "ено", "ены", "")
		if("ым")
			input_list[1] = copytext_char(input_list[1], length_char(input_list[1])-2)
			input_list.Add("ым", "ой", "ым", "ыми", "")

// Input template: "base/m_ending/f_ending/n_ending/p_ending/extra_text/case". Case defines the target's case, or hides target if unspecified.
// Bastion of Endeavor TODO: This whole proc might be redundant be we won't know for sure until we get to living defense localization
/*
/proc/verb_adv_ru(var/atom/verb_user, var/input, var/atom/target, var/index_v)
	var/list/message_list = splittext_char(input, ";")
	if(message_list.len == 1)
		return "[gender_ru(verb_user, input, index = index_v)]" // If the template is omitted, use the default verb endings.
	if(message_list.len < 6)
		log_grammar_ru("ОШИБКА: Глагол verb_adv_ru не соответствует шаблону! Ввод: [input], проверка выдала [message_list.len].")
		error("Глагол verb_adv_ru не соответствует шаблону! Ввод: [input], проверка выдала [message_list.len].")
		return message_list[1]
	var/who = message_list[7] // these few lines might be redundant thanks to interact_ru but who knows
	if (findtext_char(input, "case"))
		who = case_ru(target, message_list[7])
	return "[gender_ru(verb_user, message_list[1], message_list[2], message_list[3], message_list[4], message_list[5], index_v)][who? " [who] " : ""][message_list[6]]"
*/

// Handles the prep_override_ru var.
/proc/area_name_ru(var/area/input)
	if(!input.prep_override_ru) return "[prep_adv_ru(input, "в", PCASE)]"
	else return "на [pcase_ru(input)]"

// Basically a quick mechanical interaction message constructor for a multitude of usages. Also helps eliminate human errors in localization.
/proc/interact_ru(atom/user, var/use_verb, atom/target, var/capital = TRUE, var/case_target = ACASE, var/case_user = NCASE, var/secondary=null, var/force_mode="normal")
	if(target) return "[capital? cap_ru(user, case_user) : case_ru(user, case_user)] [verb_ru(user, use_verb)] [case_ru(target, case_target, user, secondary, force_mode)]"
	else return "[capital? cap_ru(user, case_user) : case_ru(user, case_user)] [verb_ru(user, use_verb)]"

// An alias for verb_ru + case_ru; despite the naming, verb_ru is good for adjectives/pronouns too
// Logically concat_ru is incompatible with self_check in cases_ru and is therefore omitted in this proc to avoid runtiming
/proc/concat_ru(var/word, atom/object, var/case = NCASE, var/capital = FALSE, var/secondary=null, var/force_mode="normal")
	if(capital) return "[capitalize(verb_ru(object, word))] [case_ru(object, null, case, secondary, force_mode)]"
	else return "[verb_ru(object, word)] [case_ru(object, case, null, secondary, force_mode)]"

/proc/reverse_concat_ru(var/word, atom/object, var/case = NCASE, var/capital = FALSE, var/secondary=null, var/force_mode="normal")
	if(capital) return "[capitalize(case_ru(object, null, case, secondary, force_mode))] [verb_ru(object, word)]"
	else return "[case_ru(object, case, null, secondary, force_mode)] [verb_ru(object, word)]"

// A primitive proc that undoes capitalization of ONLY the first letter
/proc/uncapitalize_ru(var/word)
	var/first_letter = copytext_char(word, 1, 2)
	var/the_rest = copytext_char(word, 2, length_char(word)+1)
	return "[lowertext(first_letter)][the_rest]"
