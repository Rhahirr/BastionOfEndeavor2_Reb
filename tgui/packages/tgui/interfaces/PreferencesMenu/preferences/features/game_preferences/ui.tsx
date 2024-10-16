import { CheckboxInput, FeatureToggle } from '../base';

export const BROWSER_STYLED: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Use Fake NanoUI Browser Style',
  category: 'UI',
  description: 'Enable a dark fake NanoUI browser style for older UIs.',
  */
  name: 'Имитировать NanoUI в окнах браузера',
  category: 'ИНТЕРФЕЙС',
  description:
    'Использовать темную тему в стиле NanoUI в окнах браузера устаревших интерфейсов.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const VCHAT_ENABLE: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Enable TGChat',
  category: 'UI',
  description: 'Enable the TGChat chat panel.',
  */
  name: 'Включить TGChat',
  category: 'ИНТЕРФЕЙС',
  description: 'Использовать систему чата TGChat.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const TGUI_SAY: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Say: Use TGUI',
  category: 'UI',
  description: 'Use TGUI for Say input.',
  */
  name: 'Речь вслух: TGUI',
  category: 'ИНТЕРФЕЙС',
  description: 'Использовать TGUI для ввода Речи вслух.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const TGUI_SAY_LIGHT_MODE: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Say: Light mode',
  category: 'UI',
  description: 'Sets TGUI Say to use a light mode.',
  */
  name: 'Речь вслух: Светлая тема TGUI',
  category: 'ИНТЕРФЕЙС',
  description: 'Использовать светлую тему TGUI при Речи вслух.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};
