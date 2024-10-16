import { CheckboxInput, FeatureToggle } from '../base';

export const RUNECHAT_MOB: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Runechat: Mobs',
  category: 'RUNECHAT',
  description: 'Chat messages will show above heads.',
  */
  name: 'Runechat для существ',
  category: 'СООБЩЕНИЯ RUNECHAT',
  description: 'Показывать сообщения чата над головами существ.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const RUNECHAT_OBJ: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Runechat: Objects',
  category: 'RUNECHAT',
  description: 'Chat messages will show above objects when they speak.',
  */
  name: 'Runechat для объектов',
  category: 'СООБЩЕНИЯ RUNECHAT',
  description: 'Показывать сообщения чата над говорящими объектами.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const RUNECHAT_BORDER: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Runechat: Letter Borders',
  category: 'RUNECHAT',
  description: 'Enables a border around each letter in a runechat message.',
  */
  name: 'Контур букв Runechat',
  category: 'СООБЩЕНИЯ RUNECHAT',
  description: 'Обводка букв в сообщениях Runechat.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const RUNECHAT_LONG: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Runechat: Long Messages',
  category: 'RUNECHAT',
  description: 'Sets runechat to show more characters.',
  */
  name: 'Длинные сообщения Runechat',
  category: 'СООБЩЕНИЯ RUNECHAT',
  description: 'Отображать больше символов в Runechat.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};
