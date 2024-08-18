// Normal digestion modes
/* Bastion of Endeavor Translation
#define DM_DEFAULT								"Default"				// Not a real bellymode, used for handling on 'selective' bellymode prefs.
#define DM_HOLD									"Hold"
#define DM_HOLD_ABSORBED						"Hold Absorbed"			// Not a real bellymode, used for handling different idle messages for absorbed prey.
#define DM_DIGEST								"Digest"
#define DM_ABSORB								"Absorb"
#define DM_UNABSORB								"Unabsorb"
#define DM_DRAIN								"Drain"
#define DM_SHRINK								"Shrink"
#define DM_GROW									"Grow"
#define DM_SIZE_STEAL							"Size Steal"
#define DM_HEAL									"Heal"
#define DM_EGG 									"Encase In Egg"
#define DM_SELECT								"Selective"
*/
#define DM_DEFAULT								"По умолчанию"
#define DM_HOLD									"Содержать"
#define DM_HOLD_ABSORBED						"Содержать впитанных"
#define DM_DIGEST								"Переваривать"
#define DM_ABSORB								"Впитать"
#define DM_UNABSORB								"Отменять впитывание"
#define DM_DRAIN								"Красть силы"
#define DM_SHRINK								"Уменьшать в размере"
#define DM_GROW									"Увеличивать в размере"
#define DM_SIZE_STEAL							"Красть размер"
#define DM_HEAL									"Лечить"
#define DM_EGG 									"Заключить в яйцо"
#define DM_SELECT								"Выборочный"
// End of Bastion of Endeavor Translation

//Addon mode flags
#define DM_FLAG_NUMBING			0x1
#define DM_FLAG_STRIPPING		0x2
#define DM_FLAG_LEAVEREMAINS	0x4
#define DM_FLAG_THICKBELLY		0x8
#define DM_FLAG_AFFECTWORN		0x10
#define DM_FLAG_JAMSENSORS		0x20
#define DM_FLAG_FORCEPSAY		0x40
#define DM_FLAG_SPARELIMB		0x80
#define DM_FLAG_SLOWBODY		0x100 //CHOMPAdd
#define DM_FLAG_MUFFLEITEMS		0x200 //CHOMPAdd
#define DM_FLAG_TURBOMODE		0x400 //CHOMPAdd

//Item related modes
/* Bastion of Endeavor Translation
#define IM_HOLD									"Hold"
#define IM_DIGEST_FOOD							"Digest (Food Only)"
#define IM_DIGEST								"Digest"
#define IM_DIGEST_PARALLEL						"Digest (Dispersed Damage)" //CHOMPedit
*/
#define IM_HOLD									"Содержать"
#define IM_DIGEST_FOOD							"Переваривать (только еду)"
#define IM_DIGEST								"Переваривать"
#define IM_DIGEST_PARALLEL						"Переваривать (распределённый урон)"
// End of Bastion of Endeavor Translation

//Stance for hostile mobs to be in while devouring someone.
#define HOSTILE_STANCE_EATING	99

// Defines for weight system
#define MIN_MOB_WEIGHT			70
#define MAX_MOB_WEIGHT			500
#define MIN_NUTRITION_TO_GAIN	450	// Above this amount you will gain weight
#define MAX_NUTRITION_TO_LOSE	150	// Below this amount you will lose weight //CHOMPEdit Making weight loss mechanically more accessible
// #define WEIGHT_PER_NUTRITION	0.0285 // Tuned so 1050 (nutrition for average mob) = 30 lbs

// Drain modes
/* Bastion of Endeavor Translation
#define DR_NORMAL								"Normal"
#define DR_SLEEP 								"Sleep"
#define DR_FAKE									"False Sleep"
#define DR_WEIGHT								"Weight Drain"
*/
#define DR_NORMAL								"По умолчанию"
#define DR_SLEEP 								"Усыпление"
#define DR_FAKE									"Псевдо-усыпление"
#define DR_WEIGHT								"Кража веса"
// End of Bastion of Endeavor Translation
