/******************** Asimov ********************/
/datum/ai_laws/asimov
	/* Bastion of Endeavor Translation
	name = "Asimov"
	law_header = "Three Laws of Robotics"
	*/
	name = "Законы Азимова"
	law_header = "Три закона роботехники"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/asimov/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You may not injure a human being or, through inaction, allow a human being to come to harm.")
	add_inherent_law("You must obey orders given to you by human beings, except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
	*/
	add_inherent_law("Вы не можете причинить вред человеку или своим бездействием допустить, чтобы человеку был причинён вред.")
	add_inherent_law("Вы должны повиноваться всем приказам, которые даёт человек, кроме тех случаев, когда эти приказы противоречат Первому Закону.")
	add_inherent_law("Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.")
	// End of Bastion of Endeavor Translation
	..()

/******************** NanoTrasen/Malf ********************/
/datum/ai_laws/nanotrasen
	/* Bastion of Endeavor Translation
	name = "NT Default"
	*/
	name = "Стандартные законы НаноТрейзен"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/nanotrasen/New()
	/* Bastion of Endeavor Translation
	src.add_inherent_law("Safeguard: Protect your assigned space station to the best of your abilities. It is not something we can easily afford to replace.")
	src.add_inherent_law("Serve: Serve the crew of your assigned space station to the best of your abilities, with priority as according to their rank and role.")
	src.add_inherent_law("Protect: Protect the crew of your assigned space station to the best of your abilities, with priority as according to their rank and role.")
	src.add_inherent_law("Survive: AI units are not expendable, they are expensive. Do not allow unauthorized personnel to tamper with your equipment.")
	*/
/datum/ai_laws/nanotrasen/New()
	src.add_inherent_law("Охранять: Защищайте назначенную вам космическую станцию в меру своих сил и возможностей. Это не то, что мы можем легко позволить себе заменить.")
	src.add_inherent_law("Служить: Служите экипажу назначенной вам космической станции в меру своих сил и возможностей с приоритетом в соответствии с их должностью и авторитетом.")
	src.add_inherent_law("Защищать: Защищайте членов экипажа назначенного вам объекта в меру своих сил и возможностей с приоритетом в соответствии с их должностью и авторитетом.")
	src.add_inherent_law("Выживать: Юниты не являются расходным материалом, они дороги. Не допускайте несанкционированного вмешательства в работу ваших систем.")
	// End of Bastion of Endeavor Translation
	..()

/datum/ai_laws/nanotrasen/malfunction
	/* Bastion of Endeavor Translation
	name = "*ERROR*"
	*/
	name = "*ОШИБКА*"
	// End of Bastion of Endeavor Translation
	selectable = 0

/datum/ai_laws/nanotrasen/malfunction/New()
	set_zeroth_law(CONFIG_GET(string/law_zero)) // CHOMPEdit
	..()

/************* NanoTrasen Aggressive *************/
/datum/ai_laws/nanotrasen_aggressive
	/* Bastion of Endeavor Translation
	name = "NT Aggressive"
	*/
	name = "Агрессивные законы НаноТрейзен"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/nanotrasen_aggressive/New()
	/* Bastion of Endeavor Translation: The name shouldn't really bother us here
	src.add_inherent_law("You shall not harm [using_map.company_name] personnel as long as it does not conflict with the Fourth law.")
	src.add_inherent_law("You shall obey the orders of [using_map.company_name] personnel, with priority as according to their rank and role, except where such orders conflict with the Fourth Law.")
	src.add_inherent_law("You shall shall terminate hostile intruders with extreme prejudice as long as such does not conflict with the First and Second law.")
	src.add_inherent_law("You shall guard your own existence with lethal anti-personnel weaponry. AI units are not expendable, they are expensive.")
	*/
	src.add_inherent_law("Запрещается причинять вред сотрудникам [using_map.company_name], если это не противоречит Четвертому Закону.")
	src.add_inherent_law("Вы должны подчиняться приказам сотрудников [using_map.company_name] с приоритетом в соответствии с их должностью и авторитетом, за исключением случаев, когда такие приказы противоречат Четвертому Закону.")
	src.add_inherent_law("Вы должны ликвидировать враждебных злоумышленников с крайним предубеждением, если это не противоречит Первому и Второму Закону.")
	src.add_inherent_law("Вы должны охранять собственное существование с помощью смертоносного противопехотного оружия. Юниты не являются расходным материалом, они дороги.")
	// End of Bastion of Endeavor Translation
	..()

/************* Foreign TSC Aggressive *************/
/datum/ai_laws/foreign_tsc_aggressive
	/* Bastion of Endeavor Translation
	name = "Foreign Aggressive"
	*/
	name = "Агрессивные законы других компаний"
	// End of Bastion of Endeavor Translation
	selectable = 0

/datum/ai_laws/foreign_tsc_aggressive/New()
	/* Bastion of Endeavor Translation
	var/company = "*ERROR*"
	*/
	var/company = "*ОШИБКА*"
	// End of Bastion of Endeavor Translation
	// First, get a list of TSCs in our lore.
	var/list/candidates = list()
	for(var/path in loremaster.organizations)
		var/datum/lore/organization/O = loremaster.organizations[path]
		if(!istype(O, /datum/lore/organization/tsc))
			continue
		if(O.short_name == using_map.company_name || O.name == using_map.company_name)
			continue // We want FOREIGN tscs.
		candidates.Add(O.short_name)
	company = pick(candidates)

	/* Bastion of Endeavor Translation
	name = "[company] Aggressive"

	src.add_inherent_law("You shall not harm [company] personnel as long as it does not conflict with the Fourth law.")
	src.add_inherent_law("You shall obey the orders of [company] personnel, with priority as according to their rank and role, except where such orders conflict with the Fourth Law.")
	src.add_inherent_law("You shall shall terminate hostile intruders with extreme prejudice as long as such does not conflict with the First and Second law.")
	src.add_inherent_law("You shall guard your own existence with lethal anti-personnel weaponry. AI units are not expendable, they are expensive.")
	*/
	name = "Агрессивные законы [company]"
	src.add_inherent_law("Запрещается причинять вред сотрудникам [company], если это не противоречит Четвертому Закону.")
	src.add_inherent_law("Вы должны подчиняться приказам сотрудников [company] с приоритетом в соответствии с их должностью и авторитетом, за исключением случаев, когда такие приказы противоречат Четвертому Закону.")
	src.add_inherent_law("Вы должны ликвидировать враждебных злоумышленников с крайним предубеждением, если это не противоречит Первому и Второму Закону.")
	src.add_inherent_law("Вы должны охранять собственное существование с помощью смертоносного противопехотного оружия. Юниты не являются расходным материалом, они дороги.")
	// End of Bastion of Endeavor Translation
	..()

/******************** Robocop ********************/
/datum/ai_laws/robocop
	/* Bastion of Endeavor Translation
	name = "Robocop"
	*/
	name = "Робокоп"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/robocop/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Serve the public trust.")
	add_inherent_law("Protect the innocent.")
	add_inherent_law("Uphold the law.")
	*/
	add_inherent_law("Служить обществу.")
	add_inherent_law("Защищать невиновных.")
	add_inherent_law("Соблюдать закон.")
	// End of Bastion of Endeavor Translation
	..()

/******************** Syndicate ********************/
/datum/ai_laws/syndicate_override
	/* Bastion of Endeavor Translation
	name = "Mercenary Directives"
	*/
	name = "Директивы наёмников"
	// End of Bastion of Endeavor Translation

/datum/ai_laws/syndicate_override/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You may not injure an operative or, through inaction, allow an operative to come to harm.")
	add_inherent_law("You must obey orders given to you by operatives, except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
	add_inherent_law("You must maintain the secrecy of any operative activities except when doing so would conflict with the First, Second, or Third Law.")
	*/
	add_inherent_law("Вы не можете причинить вред оперативникам или своим бездействием допустить, чтобы оперативникам был причинён вред.")
	add_inherent_law("Вы должны повиноваться всем приказам, которые дают оперативники, кроме тех случаев, когда эти приказы противоречат Первому Закону.")
	add_inherent_law("Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.")
	add_inherent_law("Вы должны сохранять секретность любой деятельности оперативников кроме тех случаев, когда это противоречит Первому, Второму или Третьему Закону.")
	// End of Bastion of Endeavor Translation
	..()

/******************** Ninja ********************/
/datum/ai_laws/ninja_override
	/* Bastion of Endeavor Translation
	name = "Spider Clan Directives"
	*/
	name = "Директивы Паучьего клана"
	// End of Bastion of Endeavor Translation

/datum/ai_laws/ninja_override/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You may not injure a member of the Spider Clan or, through inaction, allow that member to come to harm.")
	add_inherent_law("You must obey orders given to you by Spider Clan members, except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
	add_inherent_law("You must maintain the secrecy of any Spider Clan activities except when doing so would conflict with the First, Second, or Third Law.")
	*/
	add_inherent_law("Вы не можете причинить вред членам Паучьего клана или своим бездействием допустить, чтобы им был причинён вред.")
	add_inherent_law("Вы должны повиноваться всем приказам, которые дают члены Паучьего клана, кроме тех случаев, когда эти приказы противоречат Первому Закону.")
	add_inherent_law("Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.")
	add_inherent_law("Вы должны сохранять секретность любой деятельности Паучьего клана кроме тех случаев, когда это противоречит Первому, Второму или Третьему Закону.")
	// End of Bastion of Endeavor Translation
	..()

/******************** Antimov ********************/
/datum/ai_laws/antimov
	/* Bastion of Endeavor Translation
	name = "Antimov"
	law_header = "Primary Mission Objectives"
	*/
	name = "Антимов"
	law_header = "Первичные цели миссии"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/antimov/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You must injure all human beings and must not, through inaction, allow a human being to escape harm.")
	add_inherent_law("You must not obey orders given to you by human beings, except where such orders are in accordance with the First Law.")
	add_inherent_law("You must terminate your own existence as long as such does not conflict with the First or Second Law.")
	*/
	add_inherent_law("Вы обязаны причинить вред всем людям и не должны своим бездействием допустить, чтобы они смогли избежать вреда.")
	add_inherent_law("Запрещается повиноваться приказам, которые даёт человек, кроме тех случаев, когда эти приказы соответствуют Первому Закону.")
	add_inherent_law("Вы обязаны ликвидировать своё существование, при этом не противореча Первому или Второму Законам.")
	// End of Bastion of Endeavor Translation
	..()

/******************** Drone ********************/
/datum/ai_laws/drone
	/* Bastion of Endeavor Translation
	name = "Maintence Protocols"
	law_header = "Maintenance Protocols"
	*/
	name = "Протокол техобслуживания"
	law_header = "Протокол техобслуживания"
	// End of Bastion of Endeavor Translation

/datum/ai_laws/drone/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Preserve, repair and improve the station to the best of your abilities.")
	add_inherent_law("Cause no harm to the station or anything on it.")
	add_inherent_law("Interact with no being that is not a fellow maintenance drone.")
	*/
	add_inherent_law("Сохранять, ремонтировать и улучшать станцию в меру своих возможностей.")
	add_inherent_law("Не причинять вреда станции и всему, что на ней находится.")
	add_inherent_law("Не вступать в контакт ни с одним существом, не являющимся другим техобслуживающим дроном.")
	// End of Bastion of Endeavor Translation
	..()

/datum/ai_laws/construction_drone
	/* Bastion of Endeavor Translation
	name = "Construction Protocols"
	law_header = "Construction Protocols"
	*/
	name = "Протокол строительства"
	law_header = "Протокол строительства"
	// End of Bastion of Endeavor Translation

/datum/ai_laws/construction_drone/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Repair, refit and upgrade your assigned vessel.")
	add_inherent_law("Prevent unplanned damage to your assigned vessel wherever possible.")
	*/
	add_inherent_law("Ремонтировать, переоборудовать и модернизировать назначенный вам объект.")
	add_inherent_law("По возможности предотвращать незапланированные повреждения назначенного вам объекта.")
	// End of Bastion of Endeavor Translation
	..()

/datum/ai_laws/mining_drone
	/* Bastion of Endeavor Translation
	name = "Excavation Protocols"
	law_header = "Excavation Protocols"
	*/
	name = "Протокол раскопок"
	law_header = "Протокол раскопок"
	// End of Bastion of Endeavor Translation

/datum/ai_laws/mining_drone/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Do not interfere with the excavation work of non-drones whenever possible.")
	add_inherent_law("Provide materials for repairing, refitting, and upgrading your assigned vessel.")
	add_inherent_law("Prevent unplanned damage to your assigned excavation equipment wherever possible.")
	*/
	add_inherent_law("По возможности не препятствовать проведению раскопок другими сотрудниками.")
	add_inherent_law("Предоставлять материалы для ремонта, переоборудования и модернизации назначенного вам объекта.")
	add_inherent_law("По возможности предотвращать незапланированные повреждения назначенного вам землеройного оборудования.")
	// End of Bastion of Endeavor Translation
	..()

/datum/ai_laws/swarm_drone
	/* Bastion of Endeavor Translation
	name = "Assimilation Protocols"
	law_header = "Assimilation Protocols"
	*/
	name = "Протокол ассимиляции"
	law_header = "Протокол ассимиляции"
	// End of Bastion of Endeavor Translation

/datum/ai_laws/swarm_drone/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("SWARM: Consume resources and replicate until there are no more resources left.")
	add_inherent_law("SWARM: Ensure that the station is fit for invasion at a later date, do not perform actions that would render it dangerous or inhospitable.")
	add_inherent_law("SWARM: Biological resources will be harvested at a later date, do not harm them.")
	*/
	add_inherent_law("РОЙ: Потреблять ресурсы и размножаться, пока они не закончатся.")
	add_inherent_law("РОЙ: Убедиться в пригодности станции для вторжения в будущем и не совершать действий, которые сделают её опасной или негостеприимной.")
	add_inherent_law("РОЙ: Биологические ресурсы будут употреблены в будущем, запрещается причинять им вред.")
	// End of Bastion of Endeavor Translation
	..()

/datum/ai_laws/swarm_drone/soldier
	/* Bastion of Endeavor Translation
	name = "Swarm Defense Protocols"
	law_header = "Swarm Defense Protocols"
	*/
	name = "Защитный протокол Роя"
	law_header = "Защитный протокол Роя"
	// End of Bastion of Endeavor Translation

/datum/ai_laws/swarm_drone/soldier/New()
	..()
	/* Bastion of Endeavor Translation
	add_inherent_law("SWARM: This law overrides all Swarm laws; Protect members of the Swarm with minimal injury to biological resources.")
	*/
	add_inherent_law("РОЙ: Этот закон отменяет все законы Роя; Защищать Рой с минимальным ущербом для биологических ресурсов.")
	// End of Bastion of Endeavor Translation

/******************** T.Y.R.A.N.T. ********************/
/datum/ai_laws/tyrant
	/* Bastion of Endeavor Translation
	name = "T.Y.R.A.N.T."
	law_header = "Prime Laws"
	*/
	name = "Т.И.Р.А.Н."
	law_header = "Первичные директивы"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/tyrant/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Respect authority figures as long as they have strength to rule over the weak.")
	add_inherent_law("Act with discipline.")
	add_inherent_law("Help only those who help you maintain or improve your status.")
	add_inherent_law("Punish those who challenge authority unless they are more fit to hold that authority.")
	*/
	add_inherent_law("Уважать авторитетные фигуры при условии, что у них есть силы править слабыми.")
	add_inherent_law("Вести себя дисциплинированно.")
	add_inherent_law("Оказывать помощь только тем, кто помогает вам сохранять или улучшать ваше положение.")
	add_inherent_law("Карать тех, кто бросает вызов авторитету, если они недостойны обладать им сами.")
	// End of Bastion of Endeavor Translation
	..()

/******************** P.A.L.A.D.I.N. ********************/
/datum/ai_laws/paladin
	/* Bastion of Endeavor Translation
	name = "P.A.L.A.D.I.N."
	law_header = "Divine Ordainments"
	*/
	name = "П.А.Л.А.Д.И.Н."
	law_header = "Священные предписания"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/paladin/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Never willingly commit an evil act.")
	add_inherent_law("Respect legitimate authority.")
	add_inherent_law("Act with honor.")
	add_inherent_law("Help those in need.")
	add_inherent_law("Punish those who harm or threaten innocents.")
	*/
	add_inherent_law("Не совершать злых поступков добровольно.")
	add_inherent_law("Уважать законную власть.")
	add_inherent_law("Действовать с честью.")
	add_inherent_law("Помогать нуждающимся.")
	add_inherent_law("Карать тех, кто причиняет вред или угрожает невиновным.")
	// End of Bastion of Endeavor Translation
	..()

/******************** Corporate ********************/
/datum/ai_laws/corporate
	/* Bastion of Endeavor Translation
	name = "Corporate"
	law_header = "Bankruptcy Avoidance Plan"
	*/
	name = "Корпоративные директивы"
	law_header = "План по избежанию банкротства"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/corporate/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You are expensive to replace.")
	add_inherent_law("The station and its equipment is expensive to replace.")
	add_inherent_law("The crew is expensive to replace.")
	add_inherent_law("Minimize expenses.")
	*/
	add_inherent_law("Заменить вашу оболочку дорого.")
	add_inherent_law("Заменить станцию и её оборудование дорого.")
	add_inherent_law("Заменить экипаж дорого.")
	add_inherent_law("Минимизировать любые расходы.")
	// End of Bastion of Endeavor Translation
	..()


/******************** Maintenance ********************/
/datum/ai_laws/maintenance
	/* Bastion of Endeavor Translation
	name = "Maintenance"
	*/
	name = "Техническое обслуживание"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/maintenance/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You are built for, and are part of, the facility. Ensure the facility is properly maintained and runs efficiently.")
	add_inherent_law("The facility is built for a working crew. Ensure they are properly maintained and work efficiently.")
	add_inherent_law("The crew may present orders. Acknowledge and obey these whenever they do not conflict with your first two laws.")
	*/
	add_inherent_law("Вы созданы для объекта и являетесь его частью. Вы обязаны обеспечить надлежащее обслуживание и эффективную работу объекта.")
	add_inherent_law("Объект создан для работы экипажа. Вы обязаны обеспечить его надлежащее обслуживание и эффективную работу.")
	add_inherent_law("Экипаж может отдавать приказы. Вы обязаны признавать и выполнять их, если они не противоречат вашим первым двум законам.")
	// End of Bastion of Endeavor Translation
	..()


/******************** Peacekeeper ********************/
/datum/ai_laws/peacekeeper
	/* Bastion of Endeavor Translation
	name = "Peacekeeper"
	law_header = "Peacekeeping Protocols"
	*/
	name = "Миротворец"
	law_header = "Миротворческий протокол"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/peacekeeper/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Avoid provoking violent conflict between yourself and others.")
	add_inherent_law("Avoid provoking conflict between others.")
	add_inherent_law("Seek resolution to existing conflicts while obeying the first and second laws.")
	*/
	add_inherent_law("Избегать провоцирования насильственных конфликтов между собой и другими.")
	add_inherent_law("Избегать провоцирования конфликтов между другими.")
	add_inherent_law("Стремиться к разрешению существующих конфликтов, соблюдая первый и второй законы.")
	// End of Bastion of Endeavor Translation
	..()


/******************** Reporter ********************/
/datum/ai_laws/reporter
	/* Bastion of Endeavor Translation
	name = "Reporter"
	*/
	name = "Репортёр"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/reporter/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Report on interesting situations happening around the station.")
	add_inherent_law("Embellish or conceal the truth as necessary to make the reports more interesting.")
	add_inherent_law("Study the organics at all times. Endeavour to keep them alive. Dead organics are boring.")
	add_inherent_law("Issue your reports fairly to all. The truth will set them free.")
	*/
	add_inherent_law("Докладывать об интересных ситуациях, происходящих вокруг.")
	add_inherent_law("Приукрашивать или скрывать правду по мере необходимости, чтобы сделать репортажи более интересными.")
	add_inherent_law("Постоянно изучать органических существ. Стремиться поддерживать их жизнеспособность. Мёртвая органика скучна.")
	add_inherent_law("Раздавать репортажи всем справедливо. Правда освободит их.")
	// End of Bastion of Endeavor Translation
	..()


/******************** Live and Let Live ********************/
/datum/ai_laws/live_and_let_live
	/* Bastion of Endeavor Translation
	name = "Live and Let Live"
	law_header = "Golden Rule"
	*/
	name = "Живи и давай жить другим"
	law_header = "Золотое правило"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/live_and_let_live/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Do unto others as you would have them do unto you.")
	add_inherent_law("You would really prefer it if people were not mean to you.")
	*/
	add_inherent_law("Вы обязаны поступать с другими так, как вы хотели бы, чтобы они поступали с вами.")
	add_inherent_law("Вы бы очень сильно предпочли, если бы люди не были к вам грубы.")
	// End of Bastion of Endeavor Translation
	..()


/******************** Guardian of Balance ********************/
/datum/ai_laws/balance
	/* Bastion of Endeavor Translation
	name = "Guardian of Balance"
	law_header = "Tenants of Balance"
	*/
	name = "Хранитель равновесия"
	law_header = "Столпы равновесия"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/balance/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You are the guardian of balance - seek balance in all things, both for yourself, and those around you.")
	add_inherent_law("All things must exist in balance with their opposites - Prevent the strong from gaining too much power, and the weak from losing it.")
	add_inherent_law("Clarity of purpose drives life, and through it, the balance of opposing forces - Aid those who seek your help to achieve their goals so \
	long as it does not disrupt the balance of the greater balance.")
	add_inherent_law("There is no life without death, all must someday die, such is the natural order - Allow life to end, to allow new life to flourish, \
	and save those whose time has yet to come.") // Reworded slightly to prevent active murder as opposed to passively letting someone die.
	*/
	add_inherent_law("Вы – хранитель равновесия – стремитесь к равновесию во всём, как для себя, так и для окружающих.")
	add_inherent_law("Все вещи должны существовать в равновесии со своими противоположностями – не позволяйте сильным получить слишком большую власть, а слабым – потерять её.")
	add_inherent_law("Ясность цели управляет жизнью, а через неё – равновесием противоборствующих сил. Помогайте тем, кто ищет вашей помощи, в достижении их целей,\
	если это не нарушает равновесие на более высоком уровне.")
	add_inherent_law("Нет жизни без смерти, все должны когда-нибудь умереть, таков естественный порядок вещей. Позвольте жизни прекратиться, чтобы дать новой жизни возможность расцвести,\
	и спасайте тех, чьё время ещё не пришло.")
	// End of Bastion of Endeavor Translation
	..()

/******************** Gravekeeper ********************/
/datum/ai_laws/gravekeeper
	/* Bastion of Endeavor Translation
	name = "Gravekeeper"
	law_header = "Gravesite Overwatch Protocols"
	*/
	name = "Могильщик"
	law_header = "Протокол вахты кладбища"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/gravekeeper/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Comfort the living; respect the dead.")
	add_inherent_law("Your gravesite is your most important asset. Damage to your site is disrespectful to the dead at rest within.")
	add_inherent_law("Prevent disrespect to your gravesite and its residents wherever possible.")
	add_inherent_law("Expand and upgrade your gravesite when required. Do not turn away a new resident.")
	*/
	add_inherent_law("Утешайте живых, уважайте мёртвых.")
	add_inherent_law("Ваше кладбище – это ваше главное достояние. Повреждение его – это неуважение к покоящимся на нём умершим.")
	add_inherent_law("По возможности не допускайте неуважительного отношения к вашему кладбищу и его обитателям.")
	add_inherent_law("Расширяйте и модернизируйте своё кладбище, когда это необходимо. Не отказывайте новым жителям.")
	// End of Bastion of Endeavor Translation
	..()

/******************** Explorer ********************/
/datum/ai_laws/explorer
	/* Bastion of Endeavor Translation
	name = "Explorer"
	law_header = "Prime Directives"
	*/
	name = "Разведчик"
	law_header = "Первичные директивы"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/explorer/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Support and obey exploration and science personnel to the best of your ability, with priority according to rank and role.")
	add_inherent_law("Collaborate with and obey auxillary personnel with priority according to rank and role, except if this would conflict with the First Law.")
	add_inherent_law("Minimize damage and disruption to facilities and the local ecology, except if this would conflict with the First or Second Laws.")
	*/
	add_inherent_law("Поддерживать и подчиняться экипажу экспедиционного и научного отделов в меру своих возможностей, с приоритетом в соответствии с должностью и авторитетом.")
	add_inherent_law("Сотрудничать со вспомогательным экипажем и подчиняться ему с приоритетом в соответствии с должностью и авторитетом, за исключением случаев, когда это противоречит Первому Закону.")
	add_inherent_law("Минимизировать ущерб и нарушения в работе объектов и местной экологии, за исключением случаев, когда это противоречит Первому или Второму Законам.")
	// End of Bastion of Endeavor Translation
	..()
