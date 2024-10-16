import { CheckboxInput, FeatureToggle } from '../base';

export const CHAT_ATTACKLOGS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Attack Log Messages',
  category: 'ADMIN',
  description: 'Show attack logs.',
  */
  name: 'Лог атак',
  category: 'АДМИНИСТРАТОР',
  description: 'Show attack logs.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const CHAT_DEBUGLOGS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Debug Logs',
  category: 'ADMIN',
  description: 'Show debug logs.',
  */
  name: 'Лог отладки',
  category: 'АДМИНИСТРАТОР',
  description: 'Отображение в чате лога отладки.',
  // End of Bastion of Endeavor Translation */
  component: CheckboxInput,
};

export const CHAT_PRAYER: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Chat Prayers',
  category: 'ADMIN',
  description: 'Show prayers.',
  */
  name: 'Молитвы в чате',
  category: 'АДМИНИСТРАТОР',
  description: 'Отображать в чате молитвы персонажей.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_ADMINHELP: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Adminhelp Sound',
  category: 'ADMIN',
  description: 'Enables playing the bwoink when a new adminhelp is sent.',
  */
  name: 'Звук Помощи администратора',
  category: 'АДМИНИСТРАТОР',
  description:
    'Воспроизведение "бвоинька" при получении сообщения в Помощи администратора.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const CHAT_RADIO: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Radio Chatter',
  category: 'ADMIN',
  description: 'Completely enable/disable hearing any radio anywhere.',
  */
  name: 'Призрачная рация',
  category: 'АДМИНИСТРАТОР',
  description: 'Слышать речь в рации с любой точки карты.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const CHAT_RLOOC: FeatureToggle = {
  name: 'Дистанционный LOOC',
  category: 'АДМИНИСТРАТОР',
  description: 'Слышать локальный внеигровой чат LOOC с любой точки карты.',
  component: CheckboxInput,
};

export const CHAT_ADSAY: FeatureToggle = {
  name: 'Чат мёртвых',
  category: 'АДМИНИСТРАТОР',
  description: 'Видеть чат мёртвых вне режима наблюдателя.',
  component: CheckboxInput,
};
