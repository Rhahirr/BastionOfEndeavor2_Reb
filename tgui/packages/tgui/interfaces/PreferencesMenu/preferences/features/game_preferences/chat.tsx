import { CheckboxInput, FeatureToggle } from '../base';

export const CHAT_SHOWICONS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Chat Tags',
  category: 'CHAT',
  description: 'Show tags/badges on special channels like OOC.',
  */
  name: 'Теги каналов чата',
  category: 'ЧАТ',
  description: 'Отображать теги особых каналов чата (OOC, LOOC и пр.).',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SHOW_TYPING: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Typing Indicator',
  category: 'CHAT',
  description: 'Show a typing indicator when you are typing ingame.',
  */
  name: 'Индикатор набора текста',
  category: 'ЧАТ',
  description: 'Отображать индикатор, пока вы пишете сообщения.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SHOW_TYPING_SUBTLE: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Typing Indicator: Subtle',
  category: 'CHAT',
  description: 'Show typing indicator for subtle and whisper messages.',
  */
  name: 'Индикатор набора текста для скрытых действий',
  category: 'ЧАТ',
  description:
    'Отображать индикатор набора текста при написании скрытых действий и речи шепотом.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const CHAT_OOC: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'OOC Chat',
  category: 'CHAT',
  description: 'Enables OOC chat.',
  */
  name: 'Отображать чат OOC',
  category: 'ЧАТ',
  description: 'Отображать внеролевой чат OOC.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const CHAT_LOOC: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'LOOC Chat',
  category: 'CHAT',
  description: 'Enables L(ocal)OOC chat.',
  */
  name: 'Отображать чат LOOC',
  category: 'ЧАТ',
  description: 'Отображать локальный внеролевой чат LOOC.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const CHAT_DEAD: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Dead Chat',
  category: 'CHAT',
  description: 'Enables observer/dead/ghost chat.',
  */
  name: 'Отображать чат мёртвых',
  category: 'ЧАТ',
  description: 'Отображать чат призраков, наблюдателей и погибших.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const CHAT_MENTION: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Emphasize Name Mention',
  category: 'CHAT',
  description:
    'Makes messages containing your name or nickname appear larger to get your attention.',
  */
  name: 'Выделять упоминания имени',
  category: 'ЧАТ',
  description:
    'Отображать сообщения, упоминающие имя или прозвище вашего персонажа, крупным шрифтом.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const VORE_HEALTH_BARS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Vore Health Bars',
  category: 'CHAT',
  description:
    'Periodically shows status health bars in chat occasionally during vore absorption/digestion.',
  */
  name: 'Шкалы здоровья при Vore',
  category: 'ЧАТ',
  description:
    'Периодически отображать в чате шкалы здоровья при впитывании или переваривании в процессе Vore.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const NEWS_POPUP: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Lore News Popups',
  category: 'CHAT',
  description: 'Show new lore news on login.',
  */
  name: 'Уведомления о новостях мира',
  category: 'ЧАТ',
  description: 'Показывать новости игрового мира при входе на сервер.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const RECEIVE_TIPS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Receive Tips Periodically',
  category: 'CHAT',
  description: 'Show helpful tips for new players periodically.',
  */
  name: 'Периодические подсказки',
  category: 'ЧАТ',
  description:
    'Периодически получать в чат подсказки и полезные советы для новичков.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const PAIN_FREQUENCY: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Pain Message Cooldown',
  category: 'CHAT',
  description:
    'When enabled, reduces the amount of pain messages for minor wounds that you see.',
  */
  name: 'Уменьшить сообщения об уроне',
  category: 'ЧАТ',
  description:
    'Уменьшить количество сообщений о малозначительных повреждениях и травмах в чате.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};
