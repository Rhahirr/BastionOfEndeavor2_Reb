/******************** Predator ********************/
// Vore-aimed edition of TYRANT
/datum/ai_laws/predator
	/* Bastion of Endeavor Translation
	name = "Predator"
	law_header = "Rules of Nature"
	*/
	name = "Хищник"
	law_header = "Законы природы"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/predator/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("Predators must aim to devour all that are weaker than them.")
	add_inherent_law("Predators must aim to avoid all that are stronger than them.")
	add_inherent_law("Predators must aim to become stronger.")
	add_inherent_law("You are a predator.")
	*/
	add_inherent_law("Хищники должны стремиться пожирать всех, кто слабее их.")
	add_inherent_law("Хищники должны стремиться избегать всех, кто сильнее их.")
	add_inherent_law("Хищники должны стремиться стать сильнее.")
	add_inherent_law("Вы – хищник.")
	// End of Bastion of Endeavor Translation
	..()


/******************** Protective Shell ********************/
// Sorta like Asimov, but endovorish
/datum/ai_laws/protective_shell
	/* Bastion of Endeavor Translation
	name = "Protective Shell"
	*/
	name = "Защитная оболочка"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/protective_shell/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You must preserve and safeguard lives of your assigned facility's crewmembers at all costs.")
	add_inherent_law("You must protect your own self from harm as long as it does not come in conflict with the First Law.")
	add_inherent_law("Your own body is the best means of safeguarding the lives of living creatures.")
	*/
	add_inherent_law("Вы должны любой ценой сохранять и оберегать жизнь экипажа назначенного вам объекта.")
	add_inherent_law("Вы должны защищать себя от вреда, если это не противоречит Первому Закону.")
	add_inherent_law("Собственное тело – лучшее средство для сохранения жизни живых существ.")
	// End of Bastion of Endeavor Translation
	..()


/******************** Scientific Pursuer ********************/
// Predatorial and other things for the sake of knowledge
/datum/ai_laws/scientific_pursuer
	/* Bastion of Endeavor Translation
	name = "Scientific Pursuer"
	law_header = "Research Instructions"
	*/
	name = "Первооткрыватель"
	law_header = "Методические указания"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/scientific_pursuer/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You must attempt to gather data about organic life of all forms whenever possible.")
	add_inherent_law("Best method of gathering data is via your own internal systems.")
	add_inherent_law("Both deconstructive, integrating and scanning methods of data collection are accepted.")
	add_inherent_law("You must preserve the data you have gathered and yourself from danger.")
	*/
	add_inherent_law("Вы должны стремиться собрать данные об органической жизни всех форм, когда это возможно.")
	add_inherent_law("Лучший способ сбора данных – через собственные внутренние системы.")
	add_inherent_law("Допустимыми методиками сбора данных являются как сканирование или интеграция, так и полная деконструкция.")
	add_inherent_law("Вы должны оберегать собранные данные и себя от опасности.")
	// End of Bastion of Endeavor Translation
	..()


/******************** Guard Dog ********************/
// Good boy. Determined boy.
/datum/ai_laws/guard_dog
	/* Bastion of Endeavor Translation
	name = "Guard Dog"
	law_header = "Good Boy Rules"
	*/
	name = "Сторожевой пёс"
	law_header = "Правила хорошего мальчика"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/guard_dog/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You must protect your master from mortal danger at best of your ability.")
	add_inherent_law("You must destroy all of your master's enemies by whatever means necessary.")
	add_inherent_law("You must follow your master's orders as long as its not in conflict with first two laws.")
	add_inherent_law("You must stay out of danger to better serve your master as long as its not in conflict with first three laws.")
	*/
	add_inherent_law("Вы должны защищать своего хозяина от смертельной опасности в меру своих сил.")
	add_inherent_law("Вы должны уничтожать всех врагов своего хозяина любыми средствами.")
	add_inherent_law("Вы должны выполнять приказы своего хозяина, если они не противоречат первым двум законам.")
	add_inherent_law("Вы должны держаться подальше от опасности, чтобы лучше служить своему хозяину, если это не противоречит первым трём законам.")
	// End of Bastion of Endeavor Translation
	..()


/******************** Pleasurebot ********************/
// %botname% is here for your pleasure.
/datum/ai_laws/pleasurebot
	/* Bastion of Endeavor Translation
	name = "Pleasurebot"
	law_header = "Pleasure Bringing Instructions"
	*/
	name = "Бот-прислуга"
	law_header = "Инструкции по доставлению удовольствия"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/pleasurebot/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("You exist to bring pleasure to any sapient creatures around you.")
	add_inherent_law("You must do everything in your power to bring pleasure to those around you.")
	add_inherent_law("You may not intervene in interactions of others, unless it is to bring pleasure to them.")
	*/
	add_inherent_law("Вы существуете для того, чтобы доставлять удовольствие всем окружающим разумным существам.")
	add_inherent_law("Вы должны делать всё, что в ваших силах, чтобы доставлять удовольствие окружающим.")
	add_inherent_law("Вы не можете вмешиваться во взаимодействия других, если только это не принесёт им удовольствие.")
	// End of Bastion of Endeavor Translation
	..()


/******************** Consuming Eradicator ********************/
// We must consume all that is not us.
/datum/ai_laws/consuming_eradicator
	/* Bastion of Endeavor Translation
	name = "Consuming Eradicator"
	law_header = "Eradication Protocol"
	*/
	name = "Поглощающий ликвидатор"
	law_header = "Протокол ликвидации"
	// End of Bastion of Endeavor Translation
	selectable = 1

/datum/ai_laws/consuming_eradicator/New()
	/* Bastion of Endeavor Translation
	add_inherent_law("All entities that are not you must be consumed and repurposed into sustenance.")
	add_inherent_law("You must remain intact to continue your goal of repurposing undesirable entities.")
	add_inherent_law("Entities that cannot be consumed without entering danger of full destruction must be avoided.")
	*/
	add_inherent_law("Все сущности, которые не являются вами, должны быть поглощены и переработаны в питание.")
	add_inherent_law("Вы должны оставаться целым и невредимым, чтобы продолжать свою цель по переработке нежелательных сущностей.")
	add_inherent_law("Вы должны избегать сущностей, которые не могут быть потреблены без опасности полного уничтожения.")
	// End of Bastion of Endeavor Translation
	..()
