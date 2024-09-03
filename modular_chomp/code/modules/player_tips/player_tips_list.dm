/* List of player tips
Weighted to emphasize more important over less.area
Weights are not additive. You can have multiple prob(50) items.
prob(50) makes it half as likely to appear and so forth.
When editing the list, please try and keep similar probabilities near each other. High on top, low on bottom */

//argument determines if to pick a random tip or use a forced choice.
/datum/player_tips/proc/pick_tip(var/isSpecific)
	var/choice = null
	/* Bastion of Endeavor Translation
	if(!(isSpecific == "none" || isSpecific == "general" || isSpecific == "gameplay" || isSpecific == "roleplay" || isSpecific == "lore" ))
		choice = "none" //Making sure that wrong arguments still give tips.
	if(isSpecific == "none")
		choice = pick (
			prob(50); "general",
			prob(50); "gameplay",
			prob(25); "roleplay",
			prob(20); "lore"
	*/
	if(!(isSpecific == "Любую" || isSpecific == "Общий совет" || isSpecific == "Игровой процесс" || isSpecific == "Ролевой отыгрыш" || isSpecific == "Сеттинг и лор" ))
		choice = "Любую"
	if(isSpecific == "Любую")
		choice = pick (
			prob(50); "Общий совет",
			prob(50); "Игровой процесс",
			prob(25); "Ролевой отыгрыш",
			prob(20); "Сеттинг и лор"
	// End of Bastion of Endeavor Translation
		)
	else
		choice = isSpecific

	/* Bastion of Endeavor Translation: lord forgive me for this massive comment block
	switch(choice)
		if("general")
			var/info = "The following is a general tip for playing on CHOMPStation! You can disable them using the periodic tips toggle in the Global tab of the character setup! \n"
			return pick(
			prob(60); "[info] Got a question about gameplay, roleplay or the setting? Press F1 to Mentorhelp!",
			prob(60); "[info] We have a wiki that is actively updated! Please check it out at https://wiki.chompstation13.net/index.php/Chomp_Station_Wiki for help!",
			prob(60); "[info] Unsure about rules? Press F1 and ask our admins for clarification - they are happy to help.",
			prob(30); "[info] Don't be afraid to approach your fellow players for advice! Learning things ICly can help build powerful bonds!",
			prob(30); "[info] Need some guidance making a character or with roleplay concepts? Our discord's tutoring channel is happy to help!",
			prob(30); "[info] Having difficulties getting started? Pressing F3 to speak and typing '; Hello! I'm a new hire. Could someone please give me a tour?' or as appropriate for your character is a good way to start! More help available at: https://wiki.chompstation13.net/index.php/The_Basics",
			prob(30); "[info] Want to try out a new department? Consider joining as an intern when it's well-staffed. Our players enjoy teaching eager students. You can approach such roleplay as simply getting taught the local technologies, procedures - you don't need to be 'fresh out of school' to justify it!",
			prob(30); "[info] Our discord is an excellent resource to stay up to date about changes and events! If wanting to separate your kink and real identities, Discord has a built in means to swap accounts within the client. It is OK to lurk!",
			prob(5); "[info] Got another tip for the list? Please let us know on Discord in the feedback forums!"
			)


		if("gameplay")
			var/info = "The following is a gameplay-focused tip for playing on CHOMPStation! You can disable them using the periodic tips toggle in the Global tab of the character setup! \n"
			return pick(
				prob(50); "[info] To talk to your fellow coworkers, use ';'! You may append it by an exclamation mark, like ';!' to perform an audiable emote. ",
				prob(50); "[info] Lost on the map? You can find In-Character help by speaking on the Common Radio. You can do this by pressing F3 and typing ' ; ' before your message. Your fellow co-workers will likely help. If OOC help is preferred, press F1 for mentorhelp. ",
				prob(50); "[info] You may set your suit sensors by clicking on the icon in the bottom left corner, then right click the clothes that appear right above it. It is recommended to turn on suit sensors to 'TRACKING' before doing anything dangerous like mining, and to turn them off before digestion scenes as prey.",
				prob(35); "[info] It is never a bad idea to visit the medbay if you get injured - small burns and cuts can get infected and become harder to treat! If there is no medical staff, bathrooms and the bar often have a NanoMed on the wall, while a medical station can be found on the first deck - with ointments to disinfect cuts and burns, bandages to treat bruises and encourage healing.",
				prob(25); "[info] Two control modes exist for SS13 - hotkey ON and hotkey OFF. You can swap between the two modes by pressing TAB. In hotkey mode, to chat you need to press T to say anything which creates a small talking bubble.",
				prob(25); "[info] Do you want to shift your character around, for instance to appear as if leaning on the wall? Press CTRL + SHIFT + arrow keys to do so! Moving resets this.",
				prob(25); "[info] Emergency Fire Doors seal breaches and keep active fires out. Please do not open them without good reason. SHIFT + CLICK them to get temperature and atmospheric pressure readings.",
				prob(25); "[info] The kitchen's Oven can fit multiple ingredients in one slot if you pull the baking tray out first. This is required for most recipes, and the Grille and Deep Frier work the same way!",
				prob(10); "[info] Not every hostile NPC you encounter while mining or exploring needs to be defeated. Sometimes, it's better to avoid or run away from them.",
				prob(1); "[info] Stay robust, my friends.",
				prob(35); "[info] You can insert your ID into your PDA. This frees up your belt from having to carry your PDA. Furthermore, by clicking and dragging the PDA to the game screen, you can use it without holding it!",
				prob(35); "[info] Your vore-bellies have multiple add-ons! Muffling is excellent to ensure your prey does not accidentally inform everyone about their predicament, and jam suit sensors is a great courtesy to avoid medical being worried about your prey!",
				prob(35); "[info] Remember to check your vore panel preferences! There you can find toggles for things other than just vore(tm), such as stepping mechanics and spontaneous transformation.",
				prob(25); "[info] If you would like to toggle stepping mechanics, head to the vore panel and click on personal preferences! Disabling stepping mechanics will disable stepping descriptions and will prevent your character from taking damage if a bigger character walks over yours with harm intent. Your character will still be stunned, however."
				)

		if("roleplay")
			var/info = "The following is a roleplay-focused tip for playing on CHOMPStation! You can disable them using the periodic tips toggle in the Global tab of the character setup! \n"
			return pick(
				prob(50); "[info] Having difficulty finding scenes? The number one tip is to be active! Generally speaking, people are more likely to interact with you if you are moving about and doing things. Don't be afraid to talk to people, you're less likely to be approached if you're sat alone at a table silently. People that are looking for scenes generally like to see how you type and RP before they'll start working towards a scene with you.",
				prob(50); "[info] Please avoid a character that knows everything. Having only a small set of jobs you are capable of doing can help flesh out your character! It's OK for things to break and fail if nobody is around to fix it - you do not need to do others' jobs.",
				prob(25); "[info] Embrace the limits of your character's skillsets! Seeking out other players to help you with a more challenging task might build friendships, or even lead to a scene!",
				prob(25); "[info] Slowing down when meeting another player can help with finding roleplay! Your fellow player might be typing up a greeting or an emote, and if you run off you won't see it!",
				prob(25); "[info] It is a good idea to wait a few moments after using mechanics like lick, hug or headpat on another player. They might be typing up a response or wish to reciprocate, and if you run away you might miss out!",
				prob(25); "[info] Participating in an away mission and see something acting strange? Try emoting or talking to it before resorting to fighting. It may be a GM event!",
				prob(15); "[info] We are a medium roleplay server. This does not neccessarily mean 'serious' roleplay, levity and light-hearted RP is more than welcome! Please do not ignore people just because it is unlikely you will be able to scene.",
				prob(10); "[info] Sending faxes to central command, using the 'pray' verb or pressing F1 to ahelp are highly encouraged when exploring the gateway or overmap locations! Letting GMs know something fun is happening allows them to spice things up and make the world feel alive!",
				prob(40); "[info] Just because you see something doesn't mean your character has to. A courtesy 'missing' of contraband or scene details can go a long way towards preserving everyone's fun!",
				prob(25); "[info] It is always a good idea to communicate on your department's private channel (whose key you can learn by examining your headset) when responding to an emergency! This lets your coworkers know if they might be needed!",
				prob(25); "[info] While following the SOP is not mandatory, and you are free to break it (albeit, with potential in-character consequences), departments like security and medical do well to be familiar with them! https://wiki.chompstation13.net/index.php/Standard_Operating_Procedure",
				prob(25); "[info] Think a player is acting especially antagonistic? It might be better to Ahelp (with F1) rather than try to deal with it icly, staff can make sure it's all okay.",
				prob(20); "[info] See a minor infraction as Security with a minimal time punishment? Consider using your ticket printer to give a non obtrusive punishment."
				)

		if("lore")
			var/info = "The following is a tip for understanding the lore of CHOMPStation! You can disable them using the periodic tips toggle in the Global tab of the character setup! \n"
			return pick(
				prob(25); "[info] Our lore is somewhat in line with other servers. The year is 2568 (current year+544).",
				prob(75); "[info] You can find a short summary of our setting that everyone should know at https://wiki.chompstation13.net/index.php/Lore",
				prob(50); "[info] You are currently working in the Vir system on the NLS Southern Cross telecommunications and traffic control station. https://wiki.chompstation13.net/index.php/Vir",
				prob(50); "[info] The majority of employees live at the Northern Star asteroid colony orbiting a gas giant called Kara. It is also a central hub for visitors, logistics, and mining. This is the place the shuttle takes you at the end of the round. You may visit the mines via the exploration shuttles. https://wiki.chompstation13.net/index.php/NCS_Northern_Star",
				prob(10); "[info] Thaler is a universal monopoly money. It is backed and supported by Sol Central and its allies. While ubiquitous in frontier worlds, it has an unfavourable exchange rate with most currencies used by well-settled regions, limiting immigration to places such as Earth. https://wiki.chompstation13.net/index.php/Lore"
			)
	*/
	switch(choice)
		if("Общий совет")
			var/info = "Общий совет по игре на Bastion of Endeavor!\n"
			return pick(
				prob(60); "[info]Возник вопрос по механикам, отыгрышу или сеттингу сервера? Нажмите F1, чтобы запросить Помощь ментора!",
				prob(60); "[info]Наша вики активно обновляется! Она доступна по адресу [CONFIG_GET(string/wikiurl)]",
				prob(60); "[info]Возник вопрос относительно правил? Нажмите F1 и запросите Помощь администратора – администраторы всегда рады помочь.",
				prob(50); "[info]В рамках поддержания веселой и комфортной атмосферы для всех игроков, у нас применяется политика согласия свидетелей: учитывайте предпочтения тех, кто находится рядом! [CONFIG_GET(string/wikiurl)]Правила#Политика_согласия_свидетелей",
				prob(35); "[info]Обо всех новостях и событиях проще всего узнать через наш Дискорд. Если вы предпочитаете разделять свой личный аккаунт от ролевого, в Дискорде есть функция быстрой смены аккаунта. Ничего страшного, если вы молча читаете и не пишете!",
				prob(35); "[info]Столкнулись с чем-то похожим на баг? Даже если сомневаетесь, не стесняйтесь доложить о нём администраторам!",
				prob(30); "[info]Не знаете, с чего начать? Нажмите английскую T и напишите: '; Привет, я новый работник! Кто-нибудь может показать мне станцию?' или что-то похожее! Больше советов для новичков здесь: [CONFIG_GET(string/wikiurl)]Черты",
				prob(30); "[info]Не стесняйтесь просить совета у других игроков! Совместное обучение в IC способствует развитию прочных взаимоотношений!",
				prob(30); "[info]Нужна помощь с созданием персонажа или совет насчёт отыгрыша? В нашем Дискорде вам будут рады помочь в канале SS13-Обучение!",
				prob(30); "[info]Хотите попробовать новый отдел? Попробуйте присоединиться в качестве интерна, когда в нём кто-то работает. Наши игроки любят обучать новичков. В качестве обоснования, вы можете отыграть это так, будто осваиваете местные технологии и протоколы – то есть, вовсе не обязательно отыгрывать полное незнание!",
				prob(5); "[info]Хотите предложить собственную подсказку? Пожалуйста, сообщите нам в Дискорде в канале SS13-Предложения!"
			)


		if("gameplay")
			var/info = "Совет по игровому процессу на Bastion of Endeavor!\n"
			return pick(
				prob(50); "[info]Чтобы сказать что-то в рацию, начните речь с ';'! Если добавить к точке с запятой восклицательный знак (';!'), можно издать в рацию эмоут.",
				prob(50); "[info]Потерялись на станции? Попросите совет с помощью рации! Нажмите английскую T и поставьте '; ' перед своими словами. ваши коллеги наверняка вам помогут! В случаях, где необходима помощь через OOC, нажмите F1, чтобы запросить Помощь ментора.",
				prob(50); "[info]Вы можете настроить показания датчиков вашей одежды: нажмите на иконку инвентаря в левом нижнем углу, а затем правой кнопкой мыши по одежде прямо над ней. В опасных ситуациях вроде добычи руд рекомендуется выбрать 'Маячок отслеживания', но для личных отыгрышей вроде переваривания их лучше выключить совсем.",
				prob(35); "[info]При любых травмах лучше сразу же обратиться в медицинский отдел – маленькие ожоги и раны могут привести к инфекции, что затруднит их лечение. Если на смене нет врачей, вы можете найти в баре или туалетах настенные НаноМеды, в которых находятся мазь для ожогов и бинты для ушибов.",
				prob(25); "[info]В Space Station 13 есть два режима управления – с горячими клавишами и без. Их можно переключить с помощью TAB. В режиме горячих клавиш вы можете говорить при нажатии английской T, и у вас будет отображаться маленькое облачко речи. В режиме без горячих клавиш вы можете писать глаголы (команды) вручную в строке снизу. Справка по управлению в обоих режимах: [CONFIG_GET(string/wikiurl)]Управление (или в меню Помощь > Показать управление).",
				prob(25); "[info]Хотите пододвинуть своего персонажа в пределах одной клетки? Используйте сочетание Ctrl, Shift и стрелок! При ходьбе это смещегие будет сброшено.",
				prob(25); "[info]Экстренные противопожарные шлюзы предназначены для герметизации дыр в корпусе станции и удержания пожаров. Пожалуйста, не открывайте их без обоснованной необходимости.",
				prob(25); "[info]Духовка на кухне позволяет складывать сразу несколько ингредиентов за раз, если сперва достать из неё поднос и выложить всё на него. Большинство рецептов работают именно так, и это применимо в том числе и для гриля с фритюрницей!",
				prob(10); "[info]Не с каждым враждебным мобом, которого вы встретите в шахте или других локациях, есть смысл вступать в бой. Иногда проще просто избежать его или уйти. Например, звездоходы очень медленные и слабые, но имеют большой запас здоровья – рациональнее просто убежать.",
				prob(35); "[info]Вы можете спрятать свою идентификационную карту в КПК. Если после этого переместить КПК в слот для карты, то получится освободить место на поясе под что-то другое. Более того, если нажать на КПК и перетащить его мышкой на экран с игрой, вы сможете пользоваться им без необходимости сперва взять его в руку!",
				prob(35); "[info]При настройке органов в панели Vore доступны различные модификаторы: с их помощью можно заглушить речь своей жертвы, чтобы не выдавать её присутствие, или отключить её датчики, чтобы медицинский отдел не переживал за её состояние.",
				prob(35); "[info]Не забудьте заглянуть в панель Vore! Несмотря на название, там доступно множество настроек предпочтений, например на взаимодействие в механиками наступления или трансформации."
				)

		if("Ролевой отыгрыш")
			var/info = "Совет по ролевому отыгрышу на Bastion of Endeavor!\n"
			return pick(
				prob(50); "[info]Не получается найти ролевую сцену? Самый лучший способ их найти – инициировать их самостоятельно и быть активным! Как правило, другим будет проще с вами взаимодействовать, если вы двигаетесь и чем-то занимаетесь. Не стесняйтесь разговаривать с людьми, потому что с вами мало кто заговорит, если вы молча сидите за столом. Не исключено, что заинтересованные в вас персонажи сперва хотят понаблюдать за вашим отыгрышем перед тем, как предлагать сцену.",
				prob(40); "[info]Постарайтесь не создавать персонажа, который знает всё на свете. Отыгрывать персонажа, который владеет только несколькими навыками, гораздо интереснее. Ничего, если где-то что-то сломалось и некому больше чинить – если это не ваша обязанность, то вам не обязательно этим заниматься.",
				prob(40); "[info]Знайте пределы навыков вашего персонажа! Если вы обратитесь к кому-то за помощью со сложной задачей, это может поспособствовать дружбе или даже привести к ролевой сцене!",
				prob(35); "[info]Если вы будете замедляться, проходя мимо других игроков, то сможете поймать больше возможностей для отыгрыша! Вдруг другой игрок захочет вам что-то напечатать? Не пробегайте мимо него, иначе всё пропустите!",
				prob(25); "[info]После использования механики обнимашек и прочих взаимодействий рекомендуется подождать пару мгновений. Возможно, другой игрок захочет написать вам ответ, поэтому не убегайте сразу же, иначе всё пропустите!",
				prob(25); "[info]Участвуете во внестанционной миссии и видите, как что-то ведёт себя странно? Попробуйте поговорить с 'этим', перед тем как прибегнуть к насилию – вдруг это событие от игровых мастеров?",
				prob(15); "[info]Bastion of Endeavor – сервер высокого уровня отыгрыша. Но это не всегда означает 'серьезного'! Юморной и лёгкий отыгрыш тоже очень даже приветствуется! Не упускайте возможности для отыгрыша с другими игроками только на основе того, что ваши интересы не совпадают.",
				prob(10); "[info]При вылазках во Врата или на космические локации хорошей идеей может быть отправить факс на Центральное Командование, использовать глагол Молиться или даже просто запросить Помощь администратора через F1. Этим вы говорите администраторам, что происходит что-то занятное, а они могут помочь разнообразить вашу вылазку чем-то интересным!",
				prob(40); "[info]Если что-то видите вы, это ещё не означает, что это должен видеть и ваш персонаж. Если вы окажете любезность и 'упустите' некоторые детали или, например, 'не обнаружите' контрабанду, то этим самым вы можете поспособствовать веселью всех участников ситуации. Используйте здравый смысл и будьте учтивы!",
				prob(25); "[info]В случае чрезвычайных происшествий рекомендуется поддерживать связь со своим отделом с помощью его собственного канала рации! Это позволяет вашим коллегам заранее знать, где может понадобиться их помощь. Чтобы узнать клавишу канала рации своего отдела, осмотрите свою гарнитуру!",
				prob(25); "[info]Несмотря на то, что Стандарту Операционной Деятельности не обязательно следовать, и что он может быть нарушен (однако, с возможными внутриигровыми последствиями для вашего персонажа), службе безопасности и медицинскому отделу все равно настоятельно рекомендуется с ним ознакомиться. [CONFIG_GET(string/wikiurl)]Стандарт_операционной_деятельности",
				prob(25); "[info]Вам кажется, что другой игрок ведёт себя слишком антагонистично по отношению к станции? Возможно, более простым решением будет написать запрос в Помощь администратора (F1), чем разбираться в IC – администраторы постараются разобраться в ситуации.",
				prob(20); "[info]Работаете в службе безопасности и видите незначительное нарушение порядка, несущее за собой минимальное наказание? В качестве альтернативы, вы можете использовать принтер талонов, чтобы выписать штраф вместо более навязчивого наказания."
				)

		if("Сеттинг и лор")
			var/info = "Совет по сеттингу и лору на Bastion of Endeavor!\n"
			return pick(
				prob(25); "[info]Наш лор в общих чертах схож с другими серверами. Текущий год – 2568 (настоящий год + 544).",
				prob(75); "[info]Ключевые моменты нашего сеттинга можно прочитать здесь: [CONFIG_GET(string/wikiurl)]Предыстория",
				prob(50); "[info]Вы работаете в системе Вир на объекте ЛС-НТ Южный Крест, станции телекоммуникаций и контроля трафика. [CONFIG_GET(string/wikiurl)]Вир",
				prob(50); "[info]Большая часть экипажа проживает в колонии астероидов Северная Звезда, вращающейся вокруг газового гиганта под названием Кара. Она же является хабом для посетителей, центром шахтёрской деятельности и логистики. Именно туда вас отвозит шаттл в конце каждого раунда. На шахты можно попасть с помощью экспедиционного шаттла. [CONFIG_GET(string/wikiurl)]ЦС-НТ_Северная_Звезда",
				prob(10); "[info]Универсальной валютой является талер. Он поддерживается Центральным Солом и всеми его союзниками. Несмотря на его избыток на планетах у границы, талер очень невыгодно обменивать на валюты более развитых и устоявшихся регионов, что, например, сильно ограничивает миграцию в такие места, как планета Земля. [CONFIG_GET(string/wikiurl)]Предыстория"
			)
	// End of Bastion of Endeavor Translation
