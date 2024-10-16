import {
  CheckboxInput,
  FeatureToggle,
} from '../../../../../PreferencesMenu/preferences/features/base';

export const EMOTE_VARY: FeatureToggle = {
  name: 'Случайный тон звуковых действий',
  category: 'ИГРА',
  description: 'Случайное изменение высоты голоса при звуковых действиях.',
  component: CheckboxInput,
};

export const AUTOTRANSCORE: FeatureToggle = {
  name: 'Автоматическое уведомление трансядра',
  category: 'ИГРА',
  description:
    'Автоматически уведомлять трансядро о вашей смерти с имплантатом резервного копирования.',
  component: CheckboxInput,
};
