// Wire defines for all machines/items.

// Miscellaneous
/* Bastion of Endeavor Translation: Might want to be careful with this, unsure if actually needed
#define WIRE_DUD_PREFIX "__dud"
*/
#define WIRE_DUD_PREFIX "__ложный"
// End of Bastion of Endeavor Translation

// General
/* Bastion of Endeavor Translation
#define WIRE_IDSCAN "ID Scan"
#define WIRE_MAIN_POWER1 "Primary Power"
#define WIRE_MAIN_POWER2 "Secondary Power"
#define WIRE_AI_CONTROL "AI Control"
#define WIRE_ELECTRIFY "Electrification"
#define WIRE_SAFETY "Safety"
*/
#define WIRE_IDSCAN "Идентификатор"
#define WIRE_MAIN_POWER1 "Первичное питание"
#define WIRE_MAIN_POWER2 "Вторичное питание"
#define WIRE_AI_CONTROL "Управление ИИ"
#define WIRE_ELECTRIFY "Электрификация"
#define WIRE_SAFETY "Безопасность"
// End of Bastion of Endeavor Translation

// Vendors and smartfridges
/* Bastion of Endeavor Translation
#define WIRE_THROW_ITEM "Item Throw"
#define WIRE_CONTRABAND "Contraband"
*/
#define WIRE_THROW_ITEM "Метание товаров"
#define WIRE_CONTRABAND "Контрабанда"
// End of Bastion of Endeavor Translation

// Airlock
/* Bastion of Endeavor Translation
#define WIRE_DOOR_BOLTS "Door Bolts"
#define WIRE_BACKUP_POWER1 "Primary Backup Power"
#define WIRE_BACKUP_POWER2 "Secondary Backup Power"
#define WIRE_OPEN_DOOR "Door State"
#define WIRE_SPEED "Door Timing"
#define WIRE_BOLT_LIGHT "Bolt Lights"
*/
#define WIRE_DOOR_BOLTS "Дверные болты"
#define WIRE_BACKUP_POWER1 "Первичное резервное питание"
#define WIRE_BACKUP_POWER2 "Вторичное резервное питание"
#define WIRE_OPEN_DOOR "Состояние двери"
#define WIRE_SPEED "Тайминг двери"
#define WIRE_BOLT_LIGHT "Болтовые лампочки"
// End of Bastion of Endeavor Translation

// Air alarm
/* Bastion of Endeavor Translation
#define WIRE_SYPHON "Siphon"
#define WIRE_AALARM "Atmospherics Alarm"
*/
#define WIRE_SYPHON "Выкачивание воздуха"
#define WIRE_AALARM "Атмосферная тревога"
// End of Bastion of Endeavor Translation

// Camera
/* Bastion of Endeavor Translation
#define WIRE_FOCUS "Focus"
#define WIRE_CAM_LIGHT "Camera Light"
#define WIRE_CAM_ALARM "Camera Alarm"
*/
#define WIRE_FOCUS "Фокусировка"
#define WIRE_CAM_LIGHT "Подсветка камеры"
#define WIRE_CAM_ALARM "Тревога камеры"
// End of Bastion of Endeavor Translation

// Grid Check
/* Bastion of Endeavor Translation
#define WIRE_REBOOT "Reboot"
#define WIRE_LOCKOUT "Lockout"
#define WIRE_ALLOW_MANUAL1 "Manual Override 1"
#define WIRE_ALLOW_MANUAL2 "Manual Override 2"
#define WIRE_ALLOW_MANUAL3 "Manual Override 3"
*/
#define WIRE_REBOOT "Перезапуск"
#define WIRE_LOCKOUT "Блокировка"
#define WIRE_ALLOW_MANUAL1 "Ручное управление 1"
#define WIRE_ALLOW_MANUAL2 "Ручное управление 2"
#define WIRE_ALLOW_MANUAL3 "Ручное управление 3"
// End of Bastion of Endeavor Translation

// Jukebox
/* Bastion of Endeavor Translation
#define WIRE_POWER "Power"
#define WIRE_JUKEBOX_HACK "Hack"
#define WIRE_SPEEDUP "Speedup"
#define WIRE_SPEEDDOWN "Speeddown"
#define WIRE_REVERSE "Reverse"
#define WIRE_START "Start"
#define WIRE_STOP "Stop"
#define WIRE_PREV "Prev"
#define WIRE_NEXT "Next"
*/
#define WIRE_POWER "Питание"
#define WIRE_JUKEBOX_HACK "Взлом"
#define WIRE_SPEEDUP "Ускорение"
#define WIRE_SPEEDDOWN "Замедление"
#define WIRE_REVERSE "Обратное воспроизведение"
#define WIRE_START "Играть"
#define WIRE_STOP "Стоп"
#define WIRE_PREV "Предыдущий трек"
#define WIRE_NEXT "Следующий трек"
// End of Bastion of Endeavor Translation

// Mulebot
/* Bastion of Endeavor Translation
#define WIRE_MOB_AVOIDANCE "Mob Avoidance"
#define WIRE_LOADCHECK "Load Checking"
#define WIRE_MOTOR1 "Primary Motor"
#define WIRE_MOTOR2 "Secondary Motor"
#define WIRE_REMOTE_RX "Signal Receiver"
#define WIRE_REMOTE_TX "Signal Sender"
#define WIRE_BEACON_RX "Beacon Receiver"
*/
#define WIRE_MOB_AVOIDANCE "Избегание существ"
#define WIRE_LOADCHECK "Проверка груза"
#define WIRE_MOTOR1 "Первичный мотор"
#define WIRE_MOTOR2 "Вторичный мотор"
#define WIRE_REMOTE_RX "Приёмник сигнала"
#define WIRE_REMOTE_TX "Передатчик сигнала"
#define WIRE_BEACON_RX "Маячковый приёмник"
// End of Bastion of Endeavor Translation

// Explosives, bombs
/* Bastion of Endeavor Translation
#define WIRE_EXPLODE "Explode" // Explodes if pulsed or cut while active, defuses a bomb that isn't active on cut.
#define WIRE_EXPLODE_DELAY "Explode Delay" // Explodes immediately if cut, explodes 3 seconds later if pulsed.
#define WIRE_DISARM "Disarm" // Explicit "disarming" wire.
#define WIRE_BADDISARM "Bad Disarm" // Disarming wire, except it blows up anyways.
#define WIRE_BOMB_UNBOLT "Unbolt" // Unbolts the bomb if cut, hint on pulsed.
#define WIRE_BOMB_DELAY "Delay" // Raises the timer on pulse, does nothing on cut.
#define WIRE_BOMB_PROCEED "Proceed" // Lowers the timer, explodes if cut while the bomb is active.
#define WIRE_BOMB_ACTIVATE "Activate" // Will start a bombs timer if pulsed, will hint if pulsed while already active, will stop a timer a bomb on cut.
*/
#define WIRE_EXPLODE "Взрыв" // Explodes if pulsed or cut while active, defuses a bomb that isn't active on cut.
#define WIRE_EXPLODE_DELAY "Взрыв с задержкой" // Explodes immediately if cut, explodes 3 seconds later if pulsed.
#define WIRE_DISARM "Отключение" // Explicit "disarming" wire.
#define WIRE_BADDISARM "Ложное отключение" // Disarming wire, except it blows up anyways.
#define WIRE_BOMB_UNBOLT "Отболтировка" // Unbolts the bomb if cut, hint on pulsed.
#define WIRE_BOMB_DELAY "Задержка" // Raises the timer on pulse, does nothing on cut.
#define WIRE_BOMB_PROCEED "Ускорение" // Lowers the timer, explodes if cut while the bomb is active.
#define WIRE_BOMB_ACTIVATE "Активация" // Will start a bombs timer if pulsed, will hint if pulsed while already active, will stop a timer a bomb on cut.
// End of Bastion of Endeavor Translation

// Nuclear bomb
/* Bastion of Endeavor Translation
#define WIRE_BOMB_LIGHT "Bomb Light"
#define WIRE_BOMB_TIMING "Bomb Timing"
#define WIRE_BOMB_SAFETY "Bomb Safety"
*/
#define WIRE_BOMB_LIGHT "Лампочка бомбы"
#define WIRE_BOMB_TIMING "Тайминг бомбы"
#define WIRE_BOMB_SAFETY "Предохранитель бомбы"
// End of Bastion of Endeavor Translation

// Particle accelerator
/* Bastion of Endeavor Translation
#define WIRE_PARTICLE_POWER "Power Toggle" // Toggles whether the PA is on or not.
#define WIRE_PARTICLE_STRENGTH "Strength" // Determines the strength of the PA.
#define WIRE_PARTICLE_INTERFACE "Interface" // Determines the interface showing up.
#define WIRE_PARTICLE_POWER_LIMIT "Maximum Power" // Determines how strong the PA can be.
*/
#define WIRE_PARTICLE_POWER "Переключение питания" // Toggles whether the PA is on or not.
#define WIRE_PARTICLE_STRENGTH "Сила" // Determines the strength of the PA.
#define WIRE_PARTICLE_INTERFACE "Интерфейс" // Determines the interface showing up.
#define WIRE_PARTICLE_POWER_LIMIT "Максимальная мощность" // Determines how strong the PA can be.
// End of Bastion of Endeavor Translation

// Autolathe
/* Bastion of Endeavor Translation
#define WIRE_AUTOLATHE_HACK "Hack"
#define WIRE_AUTOLATHE_DISABLE "Disable"
*/
#define WIRE_AUTOLATHE_HACK "Взлом"
#define WIRE_AUTOLATHE_DISABLE "Отключение"
// End of Bastion of Endeavor Translation

// Radio
/* Bastion of Endeavor Translation
#define WIRE_RADIO_SIGNAL "Signal"
#define WIRE_RADIO_RECEIVER "Receiver"
#define WIRE_RADIO_TRANSMIT "Transmitter"
*/
#define WIRE_RADIO_SIGNAL "Сигнал"
#define WIRE_RADIO_RECEIVER "Приёмник"
#define WIRE_RADIO_TRANSMIT "Передатчик"
// End of Bastion of Endeavor Translation

// Cyborg
/* Bastion of Endeavor Translation
#define WIRE_BORG_LOCKED "Lockdown"
#define WIRE_BORG_CAMERA "Camera"
#define WIRE_BORG_LAWCHECK "Law Check"
*/
#define WIRE_BORG_LOCKED "Блокировка"
#define WIRE_BORG_CAMERA "Камера"
#define WIRE_BORG_LAWCHECK "Проверка законов"
// End of Bastion of Endeavor Translation

// Seed Storage
/* Bastion of Endeavor Translation
#define WIRE_SEED_SMART "Smart"
#define WIRE_SEED_LOCKDOWN "Lockdown"
*/
#define WIRE_SEED_SMART "Умный режим"
#define WIRE_SEED_LOCKDOWN "Блокировка"
// End of Bastion of Endeavor Translation

// Shield Generator
/* Bastion of Endeavor Translation
#define WIRE_SHIELD_CONTROL "Shield Controls" // Cut to lock most shield controls. Mend to unlock them. Pulse does nothing.
*/
#define WIRE_SHIELD_CONTROL "Управление щитом" // Cut to lock most shield controls. Mend to unlock them. Pulse does nothing.
// End of Bastion of Endeavor Translation

// SMES
/* Bastion of Endeavor Translation
#define WIRE_SMES_RCON "RCon"		// Remote control (AI and consoles), cut to disable
#define WIRE_SMES_INPUT "Input"		// Input wire, cut to disable input, pulse to disable for 60s
#define WIRE_SMES_OUTPUT "Output"		// Output wire, cut to disable output, pulse to disable for 60s
#define WIRE_SMES_GROUNDING "Grounding"	// Cut to quickly discharge causing sparks, pulse to only create few sparks
#define WIRE_SMES_FAILSAFES "Failsafes"	// Cut to disable failsafes, mend to reenable
*/
#define WIRE_SMES_RCON "Дистанционное управление"		// Remote control (AI and consoles), cut to disable
#define WIRE_SMES_INPUT "Приём"		// Input wire, cut to disable input, pulse to disable for 60s
#define WIRE_SMES_OUTPUT "Отдача"		// Output wire, cut to disable output, pulse to disable for 60s
#define WIRE_SMES_GROUNDING "Заземление"	// Cut to quickly discharge causing sparks, pulse to only create few sparks
#define WIRE_SMES_FAILSAFES "Предохранители"	// Cut to disable failsafes, mend to reenable
// End of Bastion of Endeavor Translation

// Suit storage unit
#define WIRE_SSU_UV "UV wire"

// Tesla coil
/* Bastion of Endeavor Translation
#define WIRE_TESLACOIL_ZAP "Zap"
*/
#define WIRE_TESLACOIL_ZAP "Шок"
// End of Bastion of Endeavor Translation

// RIGsuits
/* Bastion of Endeavor Translation
#define WIRE_RIG_SECURITY "Security"
#define WIRE_RIG_AI_OVERRIDE "AI Override"
#define WIRE_RIG_SYSTEM_CONTROL "System Control"
#define WIRE_RIG_INTERFACE_LOCK "Interface Lock"
#define WIRE_RIG_INTERFACE_SHOCK "Interface Shock"
*/
#define WIRE_RIG_SECURITY "Безопасность"
#define WIRE_RIG_AI_OVERRIDE "Управление ИИ"
#define WIRE_RIG_SYSTEM_CONTROL "Управление системой"
#define WIRE_RIG_INTERFACE_LOCK "Блокировка интерфейса"
#define WIRE_RIG_INTERFACE_SHOCK "Удар током"
// End of Bastion of Endeavor Translation
