import {
  CheckboxInput,
  FeatureToggle,
} from '../../../../../PreferencesMenu/preferences/features/base';

export const SOUND_ALARMLOOP: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Looping Alarm Sounds',
  category: 'SOUNDS',
  description: 'Enable looping alarm sounds.',
  */
  name: 'Звуки тревог',
  category: 'ЗВУКИ',
  description: 'Цикличные звуки тревог и сигнализаций.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_FRIDGEHUM: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Fridge Humming',
  category: 'SOUNDS',
  description: 'Enable fridge humming.',
  */
  name: 'Гул холодильников',
  category: 'ЗВУКИ',
  description: 'Слышать гул холодильников.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SLEEP_MUSIC: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Sleeping Music',
  category: 'SOUNDS',
  description: 'Enable sleeping music.',
  */
  name: 'Музыка при сне',
  category: 'ЗВУКИ',
  description: 'Успокаивающая музыка во время операций и криогенного сна.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};
