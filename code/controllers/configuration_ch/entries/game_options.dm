/datum/config_entry/number/health_threshold_softcrit
	default = 0

/datum/config_entry/number/health_threshold_crit
	default = 0

/datum/config_entry/number/health_threshold_dead
	default = -100

/datum/config_entry/flag/bones_can_break

/datum/config_entry/flag/limbs_can_break

/datum/config_entry/number/organ_health_multiplier
	integer = FALSE
	default = 1.0

/datum/config_entry/number/organ_regeneration_multiplier
	integer = FALSE
	default = 1.0

// FIXME: Unused
///datum/config_entry/flag/revival_pod_plants
//	default = TRUE

/datum/config_entry/flag/revival_cloning
	default = TRUE

/datum/config_entry/number/revival_brain_life
	default = -1

/// Used for modifying movement speed for mobs.
/// Universal modifiers
/datum/config_entry/number/run_speed
	default = 0

/datum/config_entry/number/walk_speed
	default = 0

///Mob specific modifiers. NOTE: These will affect different mob types in different ways
/datum/config_entry/number/human_delay
	default = 0

/datum/config_entry/number/robot_delay
	default = 0

// FIXME: Unused
///datum/config_entry/number/monkey_delay
//	default = 0

// FIXME: Unused
///datum/config_entry/number/alien_delay
//	default = 0

// FIXME: Unused
//datum/config_entry/number/slime_delay
//	default = 0

/datum/config_entry/number/animal_delay
	default = 0

/datum/config_entry/number/footstep_volume
	default = 0

/datum/config_entry/flag/use_loyalty_implants

/datum/config_entry/flag/show_human_death_message
	default = TRUE

/datum/config_entry/string/alert_desc_green
	/* Bastion of Endeavor Translation
	default = "All threats to the station have passed. Security may not have weapons visible, privacy laws are once again fully enforced."
	*/
	default = "Все угрозы станции миновали. Службе безопасности снова запрещено носить видимое оружие, а законы о неприкосновенности частной жизни снова вступили в силу."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_yellow_upto
	/* Bastion of Endeavor Translation
	default = "A minor security emergency has developed. Security personnel are to report to their supervisor for orders and may have weapons visible on their person. Privacy laws are still enforced."
	*/
	default = "Возникла слабая угроза безопасности. Службе безопасности требуется получить приказы от вышестоящего лица и разрешается иметь при себе видимое оружие. Законы о неприкосновенности частной жизни по-прежнему в силе."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_yellow_downto
	/* Bastion of Endeavor Translation
	default = "Code yellow procedures are now in effect. Security personnel are to report to their supervisor for orders and may have weapons visible on their person. Privacy laws are still enforced."
	*/
	default = "На объекте утверждён жёлтый код. Службе безопасности требуется получить приказы от вышестоящего лица и разрешается иметь при себе видимое оружие. Законы о неприкосновенности частной жизни по-прежнему в силе."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_violet_upto
	/* Bastion of Endeavor Translation
	default = "A major medical emergency has developed. Medical personnel are required to report to their supervisor for orders, and non-medical personnel are required to obey all relevant instructions from medical staff."
	*/
	default = "Возникла значительная медицинская угроза. Медицинским работникам требуется получить приказы от вышестоящего лица, всем остальным необходимо следовать инструкциям от врачей."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_violet_downto
	/* Bastion of Endeavor Translation
	default = "Code violet procedures are now in effect; Medical personnel are required to report to their supervisor for orders, and non-medical personnel are required to obey relevant instructions from medical staff."
	*/
	default = "На объекте утверждён фиолетовый код. Медицинским работникам требуется получить приказы от вышестоящего лица, всем остальным необходимо следовать инструкциям от врачей."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_orange_upto
	/* Bastion of Endeavor Translation
	default = "A major engineering emergency has developed. Engineering personnel are required to report to their supervisor for orders, and non-engineering personnel are required to evacuate any affected areas and obey relevant instructions from engineering staff."
	*/
	default = "Возникла значительная инженерная угроза. Сотрудникам инженерного отдела необходимо получить приказы от вышестоящего лица, всем остальным необходимо покинуть опасные зоны и следовать инструкциям инженеров."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_orange_downto
	/* Bastion of Endeavor Translation
	default = "Code orange procedures are now in effect; Engineering personnel are required to report to their supervisor for orders, and non-engineering personnel are required to evacuate any affected areas and obey relevant instructions from engineering staff."
	*/
	default = "На объекте утверждён оранжевый код. Сотрудникам инженерного отдела необходимо получить приказы от вышестоящего лица, всем остальным необходимо покинуть опасные зоны и следовать инструкциям инженеров."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_blue_upto
	/* Bastion of Endeavor Translation
	default = "A major security emergency has developed. Security personnel are to report to their supervisor for orders, are permitted to search staff and facilities, and may have weapons visible on their person."
	*/
	default = "Возникла значительная угроза безопасности. Службе безопасности требуется получить приказы от вышестоящего лица и разрешается иметь при себе видимое оружие, а также проводить обыск экипажа или помещений."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_blue_downto
	/* Bastion of Endeavor Translation
	default = "Code blue procedures are now in effect. Security personnel are to report to their supervisor for orders, are permitted to search staff and facilities, and may have weapons visible on their person."
	*/
	default = "На объекте утверждён синий код. Службе безопасности требуется получить приказы от вышестоящего лица и разрешается иметь при себе видимое оружие, а также проводить обыск экипажа или помещений."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_red_upto
	/* Bastion of Endeavor Translation
	default = "There is an immediate serious threat to the station. Security may have weapons unholstered at all times. Random searches are allowed and advised."
	*/
	default = "На станции существует чрезвычайно серьёзная угроза безопасности. Службе безопасности разрешено носить оружие в руках в любое время. Произвольные обыски разрешаются и рекомендуются."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_red_downto
	/* Bastion of Endeavor Translation
	default = "The self-destruct mechanism has been deactivated, there is still however an immediate serious threat to the station. Security may have weapons unholstered at all times, random searches are allowed and advised."
	*/
	default = "Протокол самоуничтожения был отменён, однако на станции по-прежнему существует чрезвычайно серьёзная угроза безопасности. Службе безопасности разрешено носить оружие в руках в любое время. Произвольные обыски разрешаются и рекомендуются."
	// End of Bastion of Endeavor Translation

/datum/config_entry/string/alert_desc_delta
	/* Bastion of Endeavor Translation
	default = "The station's self-destruct mechanism has been engaged. All crew are instructed to obey all instructions given by heads of staff. Any violations of these orders can be punished by death. This is not a drill."
	*/
	default = "Инициирован протокол самоуничтожения станции. Всему экипажу требуется следовать инструкциям от вышестоящих лиц. Невыполнение данных приказов может повлечь за собой летальный исход. Это не учебная тревога."
	// End of Bastion of Endeavor Translation
