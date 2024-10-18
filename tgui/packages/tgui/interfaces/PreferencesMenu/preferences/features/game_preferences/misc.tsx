import { CheckboxInput, FeatureToggle } from '../base';

export const AMBIENT_OCCLUSION_PREF: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Enable ambient occlusion',
  category: 'GAMEPLAY',
  description: 'Enable ambient occlusion, light shadows around characters.',
  */
  name: 'Рендеринг Ambient Occlusion',
  category: 'ИГРА',
  description: 'Отображать мягкие тени вокруг персонажей.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const MOB_TOOLTIPS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Enable mob tooltips',
  category: 'GAMEPLAY',
  description: 'Enable tooltips when hovering over mobs.',
  */
  name: 'Всплывающие подсказки для существ',
  category: 'ИГРА',
  description: 'Отображать всплывающие окна при наведении курсора на существ.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const INV_TOOLTIPS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Enable inventory tooltips',
  category: 'GAMEPLAY',
  description: 'Enable tooltips when hovering over inventory items.',
  */
  name: 'Всплывающие подсказки для инвентаря',
  category: 'ИГРА',
  description:
    'Отображать всплывающие окна при наведении курсора на предметы в инвентаре.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const ATTACK_ICONS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Attack Icons',
  category: 'GAMEPLAY',
  description:
    'Enable showing an overlay of what a mob was hit with during the attack animation.',
  */
  name: 'Иконки при атаках',
  category: 'ИГРА',
  description: 'Отображать иконку орудия, которым было атаковано существо.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const PRECISE_PLACEMENT: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Precision Placement',
  category: 'GAMEPLAY',
  description:
    'Objects placed on table will be on cursor position when enabled, or centered when disabled.',
  */
  name: 'Точное размещение предметов',
  category: 'ИГРА',
  description:
    'Выкладывать предметы на стол строго под курсором или в центре стола.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const HUD_HOTKEYS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Hotkeys Default',
  category: 'GAMEPLAY',
  description: 'Enables turning hotkey mode on by default.',
  */
  name: 'Отображение хоткейных кнопок',
  category: 'ИГРА',
  description:
    'Отображать на интерфейсе кнопки, используемые через горячие клавиши.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SHOW_PROGRESS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Progress Bar',
  category: 'GAMEPLAY',
  description: 'Enables seeing progress bars for various actions.',
  */
  name: 'Шкалы прогресса',
  category: 'ИГРА',
  description: 'Отображать шкалы прогресса при выполнении различных действий.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SAFE_FIRING: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Gun Firing Intent Requirement',
  category: 'GAMEPLAY',
  description: 'When enabled, firing a gun requires a non-help intent to fire.',
  */
  name: 'Предохранитель огнестрельного оружия',
  category: 'ИГРА',
  description:
    'Предохранитель не позволяет выстрелить из оружия при выбранном намерении Помочь.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SHOW_STATUS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Status Indicators',
  category: 'GAMEPLAY',
  description: "Enables seeing status indicators over people's heads.",
  */
  name: 'Индикаторы состояния',
  category: 'ИГРА',
  description: 'Отображать индикаторы состояния над головами персонажей.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const AUTO_AFK: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Automatic AFK Status',
  category: 'GAMEPLAY',
  description:
    'When enabled, you will automatically be marked as AFK if you are idle for too long.',
  */
  name: 'Автоматический статус "Отошел"',
  category: 'ИГРА',
  description:
    'При длительном бездействии вы будете отмечены статусом "Отошел" (AFK).',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const MessengerEmbeds: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Messenger Embeds',
  category: 'UI',
  description:
    'When enabled, PDAs and Communicators will attempt to embed links from discord & imgur.',
  */
  name: 'Вложения в мессенджерах',
  category: 'ИНТЕРФЕЙС',
  description:
    'Отображать вложения из ссылок на Discord и Imgur в коммуникаторах и КПК.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const AutoPunctuation: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Automatic Punctuation',
  category: 'GAMEPLAY',
  description:
    'When enabled, if your message ends in a letter with no punctuation, a period will be added.',
  */
  name: 'Автоматическая пунктуация',
  category: 'ИГРА',
  description:
    'Автоматически добавляет точку в конец сообщений, оканчивающихся на букву.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};
