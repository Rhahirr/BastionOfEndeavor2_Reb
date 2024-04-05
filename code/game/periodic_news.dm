// This system defines news that will be displayed in the course of a round.
// Uses BYOND's type system to put everything into a nice format

/datum/news_announcement
	var/round_time // time of the round at which this should be announced, in seconds
	var/message // body of the message
	/* Bastion of Endeavor Translation
	var/author = "NanoTrasen Editor"
	*/
	var/author = "Редакция НаноТрейзен"
	// End of Bastion of Endeavor Translation
	var/can_be_redacted = 0
	/* Bastion of Endeavor Translation
	var/message_type = "Story"
	*/
	var/message_type = "Сюжет"
	// End of Bastion of Endeavor Translation
	var/channel_name = null

/datum/news_announcement/New() // I'm sorry...
	..()
	/* Bastion of Endeavor Translation: Bastion of Endeavor TODO: Polish this after map localization!
	channel_name = "The [using_map.starsys_name] Times"
	*/
	channel_name = "Новости системы [using_map.starsys_name]"
	// End of Bastion of Endeavor Translation

/datum/news_announcement/revolution_inciting_event/paycuts_suspicion
	round_time = 60*10
	/* Bastion of Endeavor Translation
	message = {"Reports have leaked that NanoTrasen is planning to put paycuts into
				effect on many of its Research Stations in Tau Ceti. Apparently these research
				stations haven't been able to yield the expected revenue, and thus adjustments
				have to be made."}
	author = "Unauthorized"
	*/
	message = {"Согласно утечкам недавних отчётов, корпорация НаноТрейзен планирует снизить зарплаты
				множества сотрудников научно-исследовательской станции в системе Тау Кита.
				По всей видимости, эти меры были вызваны недостаточными показателями прибыли."}
	author = "Автор неизвестен"
	// End of Bastion of Endeavor Translation

/datum/news_announcement/revolution_inciting_event/paycuts_confirmation
	round_time = 60*40
	/* Bastion of Endeavor Translation
	message = {"Earlier rumours about paycuts on Research Stations in the Tau Ceti system have
				been confirmed. Shockingly, however, the cuts will only affect lower tier
				personnel. Heads of Staff will, according to our sources, not be affected."}
	author = "Unauthorized"
	*/
	message = {"Недавние слухи о снижениях зарплат на научно-исследовательских станциях в системе Тау Кита
				были подтверждены. Однако стало также известно, что данные изменения затронут только работников низшего класса.
				Согласно нашим источникам, зарплаты глав отделов останутся прежними."}
	author = "Автор неизвестен"
	// End of Bastion of Endeavor Translation

/datum/news_announcement/revolution_inciting_event/human_experiments
	round_time = 60*90
	/* Bastion of Endeavor Translation
	message = {"Unbelievable reports about human experimentation have reached our ears. According
				to a refugee from one of the Tau Ceti Research Stations, their station, in order
				to increase revenue, has refactored several of their facilities to perform experiments
				on live humans, including virology research, genetic manipulation, and \"feeding them
				to the slimes to see what happens\". Allegedly, these test subjects were neither
				humanified monkeys nor volunteers, but rather unqualified staff that were forced into
				the experiments, and reported to have died in a \"work accident\" by NanoTrasen."}
	author = "Unauthorized"
	*/
	message = {"До нас дошли шокирующие известия. Согласно беженцу одной из научно-исследовательских станций
				в системе Тау Кита, в рамках повышения доходов станцией были приняты меры по утилизации ряда помещений
				для проведения экспериментов над живыми людьми, в том числе и экспериментов вирусологического характера,
				генетической манипуляции и \"кормёжки слизням, чтобы увидеть, что будет\". Согласно заявлению беженца,
				этими работниками были не очеловеченные мартышки или волонтёры, а самые настоящие работники НаноТрейзен,
				недостаточно квалифицированные для работы и в последствии принуждённые участвовать в безумных экспериментах.
				Оглашаемая причина их гибели – \"несчастный случай\"."}
	author = "Автор неизвестен"
	// End of Bastion of Endeavor Translation

/datum/news_announcement/bluespace_research/announcement
	round_time = 60*20
	/* Bastion of Endeavor Translation
	message = {"The new field of research trying to explain several interesting spacetime oddities,
				also known as \"Bluespace Research\", has reached new heights. Of the several
				hundred space stations now orbiting in Tau Ceti, fifteen are now specially equipped
				to experiment with and research Bluespace effects. Rumours have it some of these
				stations even sport functional \"travel gates\" that can instantly move a whole research
				team to an alternate reality."}
	*/
	message = {"Новейший раздел науки, известный как \"Исследование синего пространства\" и призванный найти
				объяснение множеству интересных феноменов в пространстве и времени, достиг новых вершин.
				Из нескольки сотен космических станций, вращающихся в системе Тау Кита, пятнадцать уже обладают оборудованием,
				необходимым для изучения синепространственных явлений и проведения экспериментов. Согласно некоторым слухам,
				некоторые из этих станций даже обладают функционирующими синепространственными \"вратами\", способными переместить целую команду учёных
				в альтернативную реальность."}
	// End of Bastion of Endeavor Translation

/datum/news_announcement/random_junk/cheesy_honkers
			/* Bastion of Endeavor Translation
			author = "Assistant Editor Carl Ritz"
			channel_name = "The Gibson Gazette"
			message = {"Do cheesy honkers increase risk of having a miscarriage? Several health administrations
						say so!"}
			*/
			author = "Младший редактор Карл Ритц"
			channel_name = "Газета Гибсон"
			message = {"Приводит ли употребление сырных хонкеров к повышению риска рождения выкидыша? Так считает множество экспертов
						в области здравоохранения!"}
			// End of Bastion of Endeavor Translation
			round_time = 60 * 15

/datum/news_announcement/random_junk/net_block
	/* Bastion of Endeavor Translation
	author = "Assistant Editor Carl Ritz"
	channel_name = "The Gibson Gazette"
	message = {"Several corporations banding together to block access to 'wetskrell.nt', site administrators
	claiming violation of net laws."}
	*/
	author = "Младший редактор Карл Ритц"
	channel_name = "Газета Гибсон"
	message = {"Множество корпораций объединило усилия по блокировке доступа к 'влажныескреллы.нт', администрация сайта заявляет о нарушении закона Сети."}
	// End of Bastion of Endeavor Translation
	round_time = 60 * 50

/datum/news_announcement/random_junk/found_ssd
	/* Bastion of Endeavor Translation
	author = "Doctor Eric Hanfield"

	message = {"Several people have been found unconscious at their terminals. It is thought that it was due
				to a lack of sleep or of simply migraines from staring at the screen too long. Camera footage
				reveals that many of them were playing games instead of working and their pay has been docked
				accordingly."}
	*/
	author = "Доктор Эрик Ханфилд"
	message = {"Множество людей за последнее время было поймано спящими на своих рабочих местах.
				Было выдвинуто предположение о недосыпах работников или мигренях, вызванных длительной работой за экраном.
				Запись камер показывает, что большинство из них вместо работы играло в игры, поэтому их зарплата была изменена соответствующим образом."}
	// End of Bastion of Endeavor Translation
	round_time = 60 * 90

/datum/news_announcement/lotus_tree/explosions
	/* Bastion of Endeavor Translation
	author = "Reporter Leland H. Howards"

	message = {"The newly-christened civillian transport Lotus Tree suffered two very large explosions near the
				bridge today, and there are unconfirmed reports that the death toll has passed 50. The cause of
				the explosions remain unknown, but there is speculation that it might have something to do with
				the recent change of regulation in the Moore-Lee Corporation, a major funder of the ship, when M-L
				announced that they were officially acknowledging inter-species marriage and providing couples
				with marriage tax-benefits."}
	*/
	author = "Репортёр Леланд Г. Говардс"
	message = {"Недавно запущенное гражданское судно, именованное Древом Лотоса, сегодня потерпело два крупных взрыва,
				и, согласно неподтверждённым данным, число погибших уже превысило 50. Причина взрывов остаётся неизвестной,
				однако существует мнение, что они могли быть вызваны недавним изменением политики корпорации Мур-Ли,
				важнейшего спонсора судна. Корпорацией было объявлено официальное принятие межрасового брака, совместно с
				пакетом льгот для супругов."}
	// End of Bastion of Endeavor Translation
	round_time = 60 * 30

/datum/news_announcement/food_riots/breaking_news
	/* Bastion of Endeavor Translation
	author = "Reporter Ro'kii Ar-Raqis"
	message = {"Breaking news: Food riots have broken out throughout the Refuge asteroid colony in the Tenebrae
				Lupus system. This comes only hours after NanoTrasen officials announced they will no longer trade with the
				colony, citing the increased presence of \"hostile factions\" on the colony has made trade too dangerous to
				continue. NanoTrasen officials have not given any details about said factions. More on that at the top of
				the hour."}
	*/
	author = "Репортёр Ро'кии Ар-Ракис"
	message = {"Сенсация: По всей астероидной колонии Пристанище в системе Тенебре-Лупус разгорелись бунты.
				Несколько часов назад представители НаноТрейзен объявили прекращение торговли с колонией по причине
				\"увеличения присутствия на колонии враждебных фракций\", в связи с чем продолжение торговых отношений может быть опасным.
				Корпорация НаноТрейзен отказалась от комментариев касательно этих фракций. Продолжение через один час."}
	// End of Bastion of Endeavor Translation
	round_time = 60 * 10

/datum/news_announcement/food_riots/more
	/* Bastion of Endeavor Translation
	author = "Reporter Ro'kii Ar-Raqis"
	message = {"More on the Refuge food riots: The Refuge Council has condemned NanoTrasen's withdrawal from
	the colony, claiming \"there has been no increase in anti-NanoTrasen activity\", and \"\[the only] reason
	NanoTrasen withdrew was because the \[Tenebrae Lupus] system's Phoron deposits have been completely mined out.
	We have little to trade with them now\". NanoTrasen officials have denied these allegations, calling them
	\"further proof\" of the colony's anti-NanoTrasen stance. Meanwhile, Refuge Security has been unable to quell
	the riots. More on this at 6."}
	*/
	author = "Репортёр Ро'кии Ар-Ракис"
	message = {"Свежие известия о бунтах на Пристанище: Консульство Пристанища не согласно с действиями НаноТрейзен,
	заявляя, что \"на астероиде не зафиксировано роста деятельности, направленной против корпорации\", и что
	\"отказ НаноТрейзен от торговли вызван истощением фороновых ресурсов в системе Тенебре-Лупус, потому что торговать нечем\".
	Официальные лица НаноТрейзен опровергли эти заявления, посчитав их \"подтверждением враждебности к НаноТрейзен\".
	Служба безопасности Пристанища не справляется с усмирением бунтующих. Продолжение в 6 часов."}
	// End of Bastion of Endeavor Translation
	round_time = 60 * 60


var/global/list/newscaster_standard_feeds = list(/datum/news_announcement/bluespace_research, /datum/news_announcement/lotus_tree, /datum/news_announcement/random_junk,  /datum/news_announcement/food_riots)

/proc/process_newscaster()
	check_for_newscaster_updates(ticker.mode.newscaster_announcements)

var/global/tmp/announced_news_types = list()
/proc/check_for_newscaster_updates(type)
	for(var/subtype in subtypesof(type))
		var/datum/news_announcement/news = new subtype()
		if(news.round_time * 10 <= world.time && !(subtype in announced_news_types))
			announced_news_types += subtype
			announce_newscaster_news(news)

/proc/announce_newscaster_news(datum/news_announcement/news)
	var/datum/feed_channel/sendto
	for(var/datum/feed_channel/FC in news_network.network_channels)
		if(FC.channel_name == news.channel_name)
			sendto = FC
			break

	if(!sendto)
		sendto = new /datum/feed_channel
		sendto.channel_name = news.channel_name
		sendto.author = news.author
		sendto.locked = 1
		sendto.is_admin_channel = 1
		news_network.network_channels += sendto

	var/author = news.author ? news.author : sendto.author
	news_network.SubmitArticle(news.message, author, news.channel_name, null, !news.can_be_redacted, news.message_type)
