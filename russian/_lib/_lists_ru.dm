var/global/list/non_types_with_genders_ru = list(
	"торс" = 1,
	"пах" = 1,
	"голова" = 2,
	"левая рука" = 2,
	"правая рука" = 2,
	"левая нога" = 2,
	"правая нога" = 2,
	"левая ступня" = 2,
	"правая ступня" = 2,
	"левая ладонь" = 2,
	"правая ладонь" = 2,
	"сердце" = 3,
	"глаза" = 4,
	"гортань" = 2,
	"мозг" = 1,
	"лёгкие" = 4,
	"печень" = 2,
	"почки" = 4,
	"селезёнка" = 2,
	"желудок" = 1,
	"кишечник" = 1
)

// these are meant to be used instead of the non-_ru lists via get_key_by_value[index]
// the purpose is to utilise the values of the lists without actually translating them

var/global/list/selectable_speech_bubbles_ru = list(
	"По умолчанию" = "default",
	"Обычное" = "normal",
	"Слизень" = "slime",
	"Коммуникатор" = "comm",
	"Механизм" = "machine",
	"Синтет" = "synthetic",
	"Синтет (злой)" = "synthetic_evil",
	"Кибер" = "cyber",
	"Призрак" = "ghost",
	"Слизень (зелёный)" = "slime_green",
	"Слизень (жёлтый)" = "slime_yellow",
	"Слизень (красный)" = "slime_red",
	"Слизень (голубой)" = "slime_blue",
	"Тёмное" = "dark",
	"Растение" = "plant",
	"Клоун" = "clown",
	"Лисичка" = "fox",
	"Лисичка (латте)" = "latte_fox",
	"Лисичка (голубая)" = "blue_fox",
	"Мышка" = "maus",
	"Волк" = "wolf",
	"Красная панда" = "red_panda",
	"Голубая панда" = "blue_panda",
	"Щупальца" = "tentacles",
	"Сердечко" = "heart",
	"Мессенджер" = "textbox",
	"Одержимость" = "possessed",
	"По умолчанию (квадратное)" = "square",
	"Медицинский отдел" = "medical",
	"Медициский отдел (квадратное)" = "medical_square",
	"Кардиограмма" = "cardiogram",
	"Служба безопасности" = "security",
	"Блокнот" = "notepad",
	"Научный отдел" = "science",
	"Инженерный отдел" = "engineering",
	"Грузовой отдел" = "cargo"
)

var/list/possible_voice_types_ru = list(
	"Бип-буп" = "beep-boop",
	"Голос 1" = "goon speak 1",
	"Голос 2" = "goon speak 2",
	"Голос 3" = "goon speak 3",
	"Голос 4" = "goon speak 4",
	"Хлюп-хлюп" = "goon speak blub",
	"Робот" = "goon speak bottalk",
	"Бульк-бульк" = "goon speak buwoo",
	"Корова" = "goon speak cow",
	"Ящер" = "goon speak lizard",
	"Мопс" = "goon speak pug",
	"Мопсик" = "goon speak pugg",
	"Насекомое" = "goon speak roach",
	"Скелет" = "goon speak skelly",
	"Ксеноморф" = "xeno speak"
)

var/global/list/all_tooltip_styles_ru = list(
	"Полночь" = "Midnight",
	"Всполох" = "Plasmafire",
	"Ретро" = "Retro",
	"Слаймкор" = "Slimecore",
	"Оперативник" = "Operative",
	"Часы" = "Clockwork"
	)

var/global/list/all_genders_define_list_ru = list(
	"Мужской пол" = MALE,
	"Женский пол" = FEMALE,
	"Без пола" = NEUTER,
	"Множественное число" = PLURAL
)

var/global/list/all_id_genders_define_list_ru = list(
	"Он / Его" = MALE,
	"Она / Её" = FEMALE,
	"Оно / Его" = NEUTER,
	"Они / Их" = PLURAL
)

var/global/list/fancy_case_names_ru = list(
	RUGENDER = "Род",
	NCASE = "Им. п. ед. ч.",
	GCASE = "Род. п. ед. ч.",
	DCASE = "Дат. п. ед. ч.",
	ACASE = "Вин. п. ед. ч.",
	ICASE = "Тв. п. ед. ч.",
	PCASE = "Пр. п. ед. ч.",
	PLURAL_NCASE = "Им. п. мн. ч.",
	PLURAL_GCASE = "Род. п. мн. ч.",
	PLURAL_DCASE = "Дат. п. мн. ч.",
	PLURAL_ACASE = "Вин. п. мн. ч.",
	PLURAL_ICASE = "Тв. п. мн. ч.",
	PLURAL_PCASE = "Пр. п. мн. ч."
)

var/global/list/strip_accent_map_ru = list(
	"а́" = "а",
	"е́" = "е",
	"и́" = "и",
	"о́" = "о",
	"у́" = "у",
	"ы́" = "ы",
	"э́" = "э",
	"ю́" = "ю",
	"я́" = "я"
)

var/global/list/orebox_types_ru = list(
	"песка" = "sand",
	"гематита" = "hematite",
	"углерода" = "carbon",
	"медной руды" = "raw copper",
	"оловянной руды" = "raw tin",
	"опала пустоты" = "void opal",
	"боленита" = "painite",
	"кварца" = "quartz",
	"бокситовой руды" = "raw bauxite",
	"форона" = "phoron",
	"серебряной руды" = "silver",
	"золотой руды" = "gold",
	"мрамора" = "marble",
	"урана" = "uranium",
	"алмазов" = "diamond",
	"платиновой руды" = "platinum",
	"свинцовой руды" = "lead",
	"металлического водорода" = "mhydrogen",
	"вердантия" = "verdantium",
	"титановой руды" = "rutile"
)

var/global/list/selectable_footstep_ru = list(
	"По умолчанию" = "footstep_human",
	"Когтистые лапы" = "footstep_claw",
	"Когтистые лапки" = "footstep_lightclaw",
	"Ползучесть" = "footstep_slither"
)