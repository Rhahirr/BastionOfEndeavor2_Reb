// this is a worse version of verb_ru, pre_word is unchanged and goes first, morphables are sliced just like usual verb_ru words are, followed by the non-obj word
// i know this is some horrible snowflake code but sacrifices need to be made unless we decide to just redo upstream's code for them
/proc/non_type_verb_ru(var/pre_word, var/morphable_1, var/noun, var/morphable_2, var/after_word)
	var/debug = "[pre_word] + [morphable_1] + [noun] + [morphable_2] + [after_word]"
	var/list/split_morphable_1 = splittext_char(morphable_1, ";")
	var/list/split_morphable_2 = splittext_char(morphable_2, ";")
	var/index = non_types_with_genders_ru.Find(noun)

	if(!noun)
		log_grammar_ru("non_type_verb_ru() не получил исходное слово! [debug]")
		return
	if(split_morphable_1.len != 0 && split_morphable_1.len != 5)
		log_grammar_ru("Изменяемое слово спереди non_type_verb_ru() не соответствует шаблону! [debug]")
		return
	if(split_morphable_2.len != 0 && split_morphable_2.len != 5)
		log_grammar_ru("Изменяемое слово в конце non_type_verb_ru() не соответствует шаблону! [debug]")
		return
	if(!index)
		log_grammar_ru("non_type_verb_ru() не нашел исходное слово в списке! [debug]")
		return

	var/indexed_gender = non_types_with_genders_ru[noun]
	var/msg = pre_word

	if(morphable_1)
		msg += split_morphable_1[1]
		msg += split_morphable_1[indexed_gender+1]
	msg +=  noun
	if(morphable_2)
		msg += split_morphable_2[1]
		msg += split_morphable_2[indexed_gender+1]
	msg += after_word
	
	return msg