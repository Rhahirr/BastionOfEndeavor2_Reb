// Has anyone ever stopped to question why the verb is always "buckle" even when you interact with a bed?
// This proc may look awful, but it adds an immense amount of clarity in russian, as the actual verb used largely depends on the context and the target.
/proc/buckleverb_ru(obj/seat, mob/user, tense = "present", mob/target)
	var/who
	if(target)
		who = acase_ru(target)
	else
		who = "вас"
	if(istype(seat, /obj/structure/bed/chair/shuttle) || istype(seat, /obj/structure/bed/chair/bay/shuttle))
		switch(tense)
			//buckle
			if("present") return "[verb_ru(user, "пристёгива;ет;ет;ет;ют;")] [who] к [dcase_ru(seat)]"
			if("self") return "[verb_ru(user, "пристегнул;ся;ась;ось;ись;")] к [dcase_ru(seat)]"
			if("past") return "[verb_ru(user, "пристегнул;;а;о;и;")] [who] к [dcase_ru(seat)]"
			if("participle") return "[verb_ru(user, "пристёгнут;;а;о;ы;")] к [dcase_ru(seat)]"
			if("action") return "пристёгиваете [who] к [dcase_ru(seat)]"
			if("indefinite") return "пристегнуть [who] к [dcase_ru(seat)]"
			if("you") return "пристегнулись к [dcase_ru(seat)]"
			//unbuckle
			if("upresent") return "[verb_ru(user, "отстёгива;ет;ет;ет;ют;")] [who] от [gcase_ru(seat)]"
			if("uself") return "[verb_ru(user, "отстегнул;ся;ась;ось;ись;")] от [gcase_ru(seat)]"
			if("upast") return "[verb_ru(user, "отстегнул;;а;о;и;")] [who] от [gcase_ru(seat)]"
			if("uyou") return "отстегнулись от [gcase_ru(seat)]"
	else if(istype(seat, /obj/structure/bed/chair/comfy))
		switch(tense)
			//buckle
			if("present") return "[verb_ru(user, "усажива;ет;ет;ет;ют;")] [who] [prep_ru(seat, "в")] [acase_ru(seat)]"
			if("self") return "[verb_ru(user, "сад;ит;ит;ит;ят;ся;")] [prep_ru(seat, "в")] [acase_ru(seat)]"
			if("past") return "[verb_ru(user, "посадил;;а;о;и;")] [who] [prep_ru(seat, "в")] [acase_ru(seat)]"
			if("participle") return "[verb_ru(user, "сид;ит;ит;ит;ят;")] [prep_ru(seat, "в")] [pcase_ru(seat)]"
			if("action") return "усаживаете [who] [prep_ru(seat, "в")] [acase_ru(seat)]"
			if("indefinite") return "усадить [who] [prep_ru(seat, "в")] [acase_ru(seat)]"
			if("you") return "сели [prep_ru(seat, "в")] [acase_ru(seat)]"
			//unbuckle
			if("upresent") return "[verb_ru(user, "поднима;ет;ет;ет;ют;")] [who] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("uself") return "[verb_ru(user, "вста;ёт;ёт;ёт;ют;")] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("upast") return "[verb_ru(user, "поднял;;а;о;и;")] [who] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("uyou") return "встали [prep_ru(seat, "с")] [gcase_ru(seat)]"
	else if(istype(seat, /obj/structure/bed/chair))
		switch(tense)
			//buckle
			if("present") return "[verb_ru(user, "усажива;ет;ет;ет;ют;")] [who] на [acase_ru(seat)]"
			if("self") return "[verb_ru(user, "сад;ит;ит;ит;ят;ся;")] на [acase_ru(seat)]"
			if("past") return "[verb_ru(user, "усадил;;а;о;и;")] [who] на [acase_ru(seat)]"
			if("participle") return "[verb_ru(user, "сид;ит;ит;ит;ят;")] на [pcase_ru(seat)]"
			if("action") return "усаживаете [who] на [acase_ru(seat)]"
			if("indefinite") return "усадить [who] на [acase_ru(seat)]"
			if("you") return "сели на [acase_ru(seat)]"
			//unbuckle
			if("upresent") return "[verb_ru(user, "поднима;ет;ет;ет;ют;")] [who] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("uself") return "[verb_ru(user, "вста;ёт;ёт;ёт;ют;")] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("upast") return "[verb_ru(user, "поднял;;а;о;и;")] [who] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("uyou") return "встали [prep_ru(seat, "с")] [gcase_ru(seat)]"
	else if(istype(seat, /obj/structure/bed) || istype(seat, /obj/structure/dogbed))
		switch(tense)
			//buckle
			if("present") return "[verb_ru(user, "укладыва;ет;ет;ет;ют;")] [who] на [acase_ru(seat)]"
			if("self") return "[verb_ru(user, "лож;ит;ит;ит;ат;ся;")] на [acase_ru(seat)]"
			if("past") return "[verb_ru(user, "положил;;а;о;и;")] [who] на [acase_ru(seat)]"
			if("participle") return "[verb_ru(user, "леж;ит;ит;ит;ат;")] на [pcase_ru(seat)]"
			if("action") return "укладываете [who] на [acase_ru(seat)]"
			if("indefinite") return "положить [who] на [acase_ru(seat)]"
			if("you") return "легли на [acase_ru(seat)]"
			//unbuckle
			if("upresent") return "[verb_ru(user, "поднима;ет;ет;ет;ют;")] [who] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("uself") return "[verb_ru(user, "вста;ёт;ёт;ёт;ют;")] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("upast") return "[verb_ru(user, "поднял;;а;о;и;")] [who] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("uyou") return "встали [prep_ru(seat, "с")] [gcase_ru(seat)]"
	else
		switch(tense)
			//buckle
			if("present") return "[verb_ru(user, "усажива;ет;ет;ет;ют;")] [who] на [acase_ru(seat)]"
			if("self") return "[verb_ru(user, "сад;ит;ит;ит;ат;ся;")] на [acase_ru(seat)]"
			if("past") return "[verb_ru(user, "усадил;;а;о;и;")] [who] на [acase_ru(seat)]"
			if("participle") return "[verb_ru(user, "сид;ит;ит;ит;ят;")] на [pcase_ru(seat)]"
			if("action") return "усаживаете [who] на [acase_ru(seat)]"
			if("indefinite") return "усадить [who] на [acase_ru(seat)]"
			if("you") return "сели на [acase_ru(seat)]"
			//unbuckle
			if("upresent") return "[verb_ru(user, "поднима;ет;ет;ет;ют;")] [who] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("uself") return "[verb_ru(user, "вста;ёт;ёт;ёт;ют;")] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("upast") return "[verb_ru(user, "поднял;;а;о;и;")] [who] [prep_ru(seat, "с")] [gcase_ru(seat)]"
			if("uyou") return "встали [prep_ru(seat, "с")] [gcase_ru(seat)]"