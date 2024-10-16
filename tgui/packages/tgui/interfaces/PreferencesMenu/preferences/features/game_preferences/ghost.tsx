import { CheckboxInput, FeatureToggle } from '../base';

export const WHISUBTLE_VIS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Allow ghosts to see whispers/subtles',
  category: 'GHOST',
  description: 'Enables ghosts to see your whispers and subtle emotes.',
  */
  name: 'Отображать скрытые действия/шепот призракам',
  category: 'РЕЖИМ ПРИЗРАКА',
  description: 'Позволять призракам видеть ваши скрытые действия и шепот.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const GHOST_SEE_WHISUBTLE: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'See whispers/subtles as ghost',
  category: 'GHOST',
  description: 'As a ghost, see whispers and subtles.',
  */
  name: 'Призрачная внимательность',
  category: 'РЕЖИМ ПРИЗРАКА',
  description: 'Видеть скрытые действия/шепот в режиме призрака.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const CHAT_GHOSTEARS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Ghost Ears',
  category: 'GHOST',
  description: 'When enabled, hear all speech; otherwise, only hear nearby.',
  */
  name: 'Призрачный слух',
  category: 'РЕЖИМ ПРИЗРАКА',
  description: 'Слышать всю речь на карте, не только поблизости.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const CHAT_GHOSTSIGHT: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Ghost Sight',
  category: 'GHOST',
  description: 'When enabled, hear all emotes; otherwise, only hear nearby.',
  */
  name: 'Призрачное зрение',
  category: 'РЕЖИМ ПРИЗРАКА',
  description: 'Видеть все действия на карте, не только поблизости.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const CHAT_GHOSTRADIO: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Ghost Radio',
  category: 'GHOST',
  description: 'When enabled, hear all radio; otherwise, only hear nearby.',
  */
  name: 'Призрачная рация',
  category: 'РЕЖИМ ПРИЗРАКА',
  description:
    'Слышать всю речь по рации, не только поблизости или в общем канале.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};
