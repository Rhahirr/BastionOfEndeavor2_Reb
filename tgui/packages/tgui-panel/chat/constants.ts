/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

// export const MAX_VISIBLE_MESSAGES = 2500; No longer a constant
// export const MAX_PERSISTED_MESSAGES = 1000; No longer a constant
// export const MESSAGE_SAVE_INTERVAL = 10000; No longer a constant
export const MESSAGE_PRUNE_INTERVAL = 60000;
// export const COMBINE_MAX_MESSAGES = 5; No longer a constant
// export const COMBINE_MAX_TIME_WINDOW = 5000; No longer a constant
export const IMAGE_RETRY_DELAY = 250;
export const IMAGE_RETRY_LIMIT = 10;
export const IMAGE_RETRY_MESSAGE_AGE = 60000;

// Default message type
export const MESSAGE_TYPE_UNKNOWN = 'unknown';

// Internal message type
export const MESSAGE_TYPE_INTERNAL = 'internal';

// Must match the set of defines in code/__DEFINES/chat.dm
export const MESSAGE_TYPE_SYSTEM = 'system';
export const MESSAGE_TYPE_LOCALCHAT = 'localchat';
export const MESSAGE_TYPE_NPCEMOTE = 'npcemote';
export const MESSAGE_TYPE_MULTIZCHAT = 'multizsay';
export const MESSAGE_TYPE_PLOCALCHAT = 'plocalchat';
export const MESSAGE_TYPE_VORE = 'vore';
export const MESSAGE_TYPE_HIVEMIND = 'hivemind';
export const MESSAGE_TYPE_RADIO = 'radio';
export const MESSAGE_TYPE_NIF = 'nif';
export const MESSAGE_TYPE_INFO = 'info';
export const MESSAGE_TYPE_WARNING = 'warning';
export const MESSAGE_TYPE_DEADCHAT = 'deadchat';
export const MESSAGE_TYPE_OOC = 'ooc';
export const MESSAGE_TYPE_LOOC = 'looc';
export const MESSAGE_TYPE_ADMINPM = 'adminpm';
export const MESSAGE_TYPE_MENTORPM = 'mentorpm';
export const MESSAGE_TYPE_COMBAT = 'combat';
export const MESSAGE_TYPE_CHATPRINT = 'chatprint';
export const MESSAGE_TYPE_ADMINCHAT = 'adminchat';
export const MESSAGE_TYPE_MODCHAT = 'modchat';
export const MESSAGE_TYPE_RLOOC = 'rlooc';
export const MESSAGE_TYPE_PRAYER = 'prayer';
export const MESSAGE_TYPE_EVENTCHAT = 'eventchat';
export const MESSAGE_TYPE_ADMINLOG = 'adminlog';
export const MESSAGE_TYPE_ATTACKLOG = 'attacklog';
export const MESSAGE_TYPE_DEBUG = 'debug';

// Metadata for each message type
export const MESSAGE_TYPES = [
  // Always-on types
  {
    type: MESSAGE_TYPE_SYSTEM,
    /* Bastion of Endeavor Translation
    name: 'System Messages',
    description: 'Messages from your client, always enabled',
    */
    name: 'Системные сообщения',
    description: 'Сообщения клиента (всегда активно)',
    /* End of Bastion of Endeavor Translation */
    selector: '.boldannounce',
    important: true,
  },
  // Basic types
  {
    type: MESSAGE_TYPE_NPCEMOTE, // Needs to be first
    /* Bastion of Endeavor Translation
    name: 'NPC Emotes / Says',
    description: 'In-character emotes and says from NPCs',
    */
    name: 'Действия NPC',
    description: 'Действия от существ, не являющихся игроками',
    /* End of Bastion of Endeavor Translation */
    selector: '.npcemote, .npcsay',
  },
  {
    type: MESSAGE_TYPE_MULTIZCHAT,
    /* Bastion of Endeavor Translation
    name: 'MultiZ Emotes / Says',
    description: 'In-character emotes and says from levels above/below',
    */
    name: 'Сообщения между этажами',
    description: 'Ролевые сообщения от персонажей на этажах над/под вами',
    /* End of Bastion of Endeavor Translation */
    selector: '.multizsay',
  },
  {
    type: MESSAGE_TYPE_LOCALCHAT,
    /* Bastion of Endeavor Translation
    name: 'Local',
    description: 'In-character local messages (say, emote, etc)',
    */
    name: 'Сообщения поблизости',
    description: 'Ролевые сообщения поблизости (речь, действия и т.п)',
    /* End of Bastion of Endeavor Translation */
    selector: '.say, .emote, .emotesubtle',
  },
  {
    type: MESSAGE_TYPE_PLOCALCHAT,
    /* Bastion of Endeavor Translation
    name: 'Local (Pred/Prey)',
    description: 'Messages from / to absorbed or dominated prey',
    */
    name: 'Внутренние сообщения',
    description: 'Сообщения от/для поглощённой или подконтрольной жертвы',
    /* End of Bastion of Endeavor Translation */
    selector: '.psay, .pemote',
  },
  {
    type: MESSAGE_TYPE_VORE,
    /* Bastion of Endeavor Translation
    name: 'Vorgan Messages',
    description: 'Messages regarding vore interactions',
    */
    name: 'Сообщения Vore',
    description: 'Взаимодействия, связанные с Vore',
    /* End of Bastion of Endeavor Translation */
    selector: '.valert, .vwarning, .vnotice, .vdanger',
  },
  {
    type: MESSAGE_TYPE_HIVEMIND,
    /* Bastion of Endeavor Translation
    name: 'Global Say',
    description: 'All global languages (Hivemind / Binary)',
    */
    name: 'Глобальные языки',
    description: 'Сообщения глобальных языков (рой, цифровой)',
    /* End of Bastion of Endeavor Translation */
    selector: '.hivemind, .binarysay',
  },
  {
    type: MESSAGE_TYPE_RADIO,
    /* Bastion of Endeavor Translation
    name: 'Radio',
    description: 'All departments of radio messages',
    */
    name: 'Рация',
    description: 'Сообщения по рации всех отделов',
    /* End of Bastion of Endeavor Translation */
    selector:
      '.alert, .minorannounce, .syndradio, .centradio, .airadio, .comradio, .secradio, .gangradio, .engradio, .medradio, .sciradio, .supradio, .srvradio, .expradio, .radio, .deptradio, .newscaster, .resonate, .abductor, .alien, .changeling',
  },
  {
    type: MESSAGE_TYPE_NIF,
    /* Bastion of Endeavor Translation
    name: 'NIF',
    description: 'Messages from the NIF itself and people inside',
    */
    name: 'НИФ',
    description: 'Уведомления НИФ и сообщения от персонажей внутри него',
    /* End of Bastion of Endeavor Translation */
    selector: '.nif',
  },
  {
    type: MESSAGE_TYPE_INFO,
    /* Bastion of Endeavor Translation
    name: 'Info',
    description: 'Non-urgent messages from the game and items',
    */
    name: 'Информация',
    description: 'Информативные сообщения о взаимодействиях',
    /* End of Bastion of Endeavor Translation */
    selector:
      '.notice:not(.pm):not(.mentor), .adminnotice:not(.pm), .info, .sinister, .cult, .infoplain, .announce, .hear, .smallnotice, .holoparasite, .boldnotice',
  },
  {
    type: MESSAGE_TYPE_WARNING,
    /* Bastion of Endeavor Translation
    name: 'Warnings',
    description: 'Urgent messages from the game and items',
    */
    name: 'Предупреждения',
    description: 'Важные сообщения о взаимодействиях',
    /* End of Bastion of Endeavor Translation */
    selector:
      '.warning:not(.pm):not(.mentor), .critical, .userdanger, .alertsyndie, .warningplain',
  },
  {
    type: MESSAGE_TYPE_DEADCHAT,
    /* Bastion of Endeavor Translation
    name: 'Deadchat',
    description: 'All of deadchat',
    */
    name: 'Чат мёртвых',
    description: 'Сообщения от призраков',
    /* End of Bastion of Endeavor Translation */
    selector: '.deadsay, .ghostalert',
  },
  {
    type: MESSAGE_TYPE_OOC,
    /* Bastion of Endeavor Translation
    name: 'OOC',
    description: 'The bluewall of global OOC messages',
    */
    name: 'OOC',
    description: 'Глобальные неролевые сообщения в чате OOC',
    /* End of Bastion of Endeavor Translation */
    selector: '.ooc, .adminooc, .adminobserverooc, .oocplain',
  },
  {
    type: MESSAGE_TYPE_LOOC,
    /* Bastion of Endeavor Translation
    name: 'Local OOC',
    description: 'Local OOC messages, always enabled',
    */
    name: 'Локальный OOC',
    description: 'Локальные неролевые сообщения чата LOOC, всегда активно',
    /* End of Bastion of Endeavor Translation */
    selector: '.looc',
    important: true,
  },
  {
    type: MESSAGE_TYPE_ADMINPM,
    /* Bastion of Endeavor Translation
    name: 'Admin PMs',
    description: 'Messages to/from admins (adminhelp)',
    */
    name: 'Сообщения администрации',
    description: 'Сообщения администраторов в Помощи администратора',
    /* End of Bastion of Endeavor Translation */
    selector: '.pm, .adminhelp',
  },
  {
    type: MESSAGE_TYPE_MENTORPM,
    /* Bastion of Endeavor Translation
    name: 'Mentor PMs',
    description: 'Mentorchat and mentor pms',
    */
    name: 'Сообщения менторов',
    description: 'Чат менторов и сообщения в Помощи ментора',
    /* End of Bastion of Endeavor Translation */
    selector: '.mentor_channel, .mentor',
  },
  {
    type: MESSAGE_TYPE_COMBAT,
    /* Bastion of Endeavor Translation
    name: 'Combat Log',
    description: 'Urist McTraitor has stabbed you with a knife!',
    */
    name: 'Боевые сообщения',
    description: 'Антагонист МакПредатель проткнул вас ножом!',
    /* End of Bastion of Endeavor Translation */
    selector: '.danger',
  },
  {
    type: MESSAGE_TYPE_CHATPRINT,
    /* Bastion of Endeavor Translation
    name: 'Chat prints',
    description: 'Chat outputs of ooc notes or vorebelly exports',
    */
    name: 'Выписки в чат',
    description: 'Экспортируемая информация примечаний OOC или органов Vore.',
    /* End of Bastion of Endeavor Translation */
    selector: '.chatexport',
  },
  {
    type: MESSAGE_TYPE_UNKNOWN,
    /* Bastion of Endeavor Translation
    name: 'Unsorted',
    description: 'Everything we could not sort, always enabled',
    */
    name: 'Несортированное',
    description: 'Всё, что не попадает под остальные фильтры, всегда активно',
    /* End of Bastion of Endeavor Translation */
  },
  // Admin stuff
  {
    type: MESSAGE_TYPE_ADMINCHAT,
    /* Bastion of Endeavor Translation
    name: 'Admin Chat',
    description: 'ASAY messages',
    */
    name: 'Чат администраторов',
    description: 'Сообщения чата администраторов',
    /* End of Bastion of Endeavor Translation */
    selector: '.admin_channel, .adminsay',
    admin: true,
  },
  {
    type: MESSAGE_TYPE_MODCHAT,
    /* Bastion of Endeavor Translation
    name: 'Mod Chat',
    description: 'MSAY messages',
    */
    name: 'Чат модераторов',
    description: 'Сообщения чата модераторов',
    /* End of Bastion of Endeavor Translation */
    selector: '.mod_channel',
    admin: true,
  },
  {
    type: MESSAGE_TYPE_EVENTCHAT,
    /* Bastion of Endeavor Translation
    name: 'Event Chat',
    description: 'ESAY messages',
    */
    name: 'Чат событий',
    description: 'Сообщения чата организаторов событий',
    /* End of Bastion of Endeavor Translation */
    selector: '.event_channel',
    admin: true,
  },
  {
    type: MESSAGE_TYPE_RLOOC,
    /* Bastion of Endeavor Translation
    name: 'Remote LOOC',
    description: 'Remote LOOC messages',
    */
    name: 'Дистанционный LOOC',
    description: 'Сообщения локального неролевого чата LOOC на расстоянии',
    /* End of Bastion of Endeavor Translation */
    selector: '.rlooc',
    admin: true,
  },
  {
    type: MESSAGE_TYPE_PRAYER,
    /* Bastion of Endeavor Translation
    name: 'Prayers',
    description: 'Prayers from players',
    */
    name: 'Молитвы',
    description: 'Молитвы от игроков',
    /* End of Bastion of Endeavor Translation */
    admin: true,
  },
  {
    type: MESSAGE_TYPE_ADMINLOG,
    /* Bastion of Endeavor Translation
    name: 'Admin Log',
    description: 'ADMIN LOG: Urist McAdmin has jumped to coordinates X, Y, Z',
    */
    name: 'Лог администраторов',
    description: 'АДМИН-ЛОГ: Админ МакПедаль прыгнул на координаты X, Y, Z',
    /* End of Bastion of Endeavor Translation */
    selector: '.log_message, .filter_adminlog',
    admin: true,
  },
  {
    type: MESSAGE_TYPE_ATTACKLOG,
    /* Bastion of Endeavor Translation
    name: 'Attack Log',
    description: 'Urist McTraitor has shot John Doe',
    */
    name: 'Лог атак',
    description: 'Антагонист МакПредатель пристрелил Джона Смита!',
    /* End of Bastion of Endeavor Translation */
    admin: true,
  },
  {
    type: MESSAGE_TYPE_DEBUG,
    /* Bastion of Endeavor Translation
    name: 'Debug Log',
    description: 'DEBUG: SSPlanets subsystem Recover().',
    */
    name: 'Лог отладки',
    description: 'ОТЛАДКА: Recover() подсистемы SSPlanets.',
    /* End of Bastion of Endeavor Translation */
    selector: '.filter_debuglogs',
    admin: true,
  },
];
