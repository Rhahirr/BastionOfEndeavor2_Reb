import { CheckboxInput, FeatureToggle } from '../base';

export const SOUND_MIDI: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Play Admin MIDIs',
  category: 'SOUNDS',
  description: 'Enable hearing admin played sounds.',
  */
  name: 'Музыка от администраторов',
  category: 'ЗВУКИ',
  description:
    'Переключить воспроизведение музыки, включенной администраторами.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_LOBBY: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Play Lobby Music',
  category: 'SOUNDS',
  description: 'Enable hearing lobby music.',
  */
  name: 'Музыка в лобби',
  category: 'ЗВУКИ',
  description: 'Переключить воспроизведение музыки в лобби.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_AMBIENCE: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Play Ambience',
  category: 'SOUNDS',
  description: 'Enable hearing ambient sounds and music.',
  */
  name: 'Звуки окружения',
  category: 'ЗВУКИ',
  description: 'Переключить воспроизведение звуков окружения.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_JUKEBOX: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Play Jukebox Music',
  category: 'SOUNDS',
  description: 'Enable hearing music from the jukebox.',
  */
  name: 'Звуки музыкального автомата',
  category: 'ЗВУКИ',
  description: 'Переключить воспроизведение звуков музыкального автомата.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_INSTRUMENT: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Hear In-game Instruments',
  category: 'SOUNDS',
  description: 'Enable hearing instruments playing.',
  */
  name: 'Звуки музыкальных инструментов',
  category: 'ЗВУКИ',
  description: 'Переключить воспроизведение звуков музыкальных инструментов.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const EMOTE_NOISES: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Emote Noises',
  category: 'SOUNDS',
  description: 'Enable hearing noises from emotes.',
  */
  name: 'Звуки озвученных действий',
  category: 'ЗВУКИ',
  description: 'Воспроизводить звуковые эффекты озвученных действий.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const RADIO_SOUNDS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Radio Sounds',
  category: 'SOUNDS',
  description: 'Enable hearing a sound when somebody speaks over your headset.',
  */
  name: 'Звуки рации',
  category: 'ЗВУКИ',
  description: 'Сопровождать речь в рации звуковым эффектом',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SAY_SOUNDS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Say Sounds',
  category: 'SOUNDS',
  description: 'Enable hearing a sound when somebody speaks using say.',
  */
  name: 'Звуки голоса',
  category: 'ЗВУКИ',
  description: 'Сопровождать речь вслух звуком голоса персонажа.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const EMOTE_SOUNDS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Me Sounds',
  category: 'SOUNDS',
  description: 'Enable hearing a sound when somebody uses me.',
  */
  name: 'Звуки действий',
  category: 'ЗВУКИ',
  description: 'Сопровождать действия звуком голоса персонажа.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const WHISPER_SOUNDS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Whisper Sounds',
  category: 'SOUNDS',
  description: 'Enable hearing a sound when somebody speaks using whisper.',
  */
  name: 'Звуки шепота',
  category: 'ЗВУКИ',
  description: 'Сопровождать речь шепотом звуком голоса персонажа.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SUBTLE_SOUNDS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Subtle Sounds',
  category: 'SOUNDS',
  description: 'Enable hearing a sound when somebody uses subtle.',
  */
  name: 'Звуки скрытых действий',
  category: 'ЗВУКИ',
  description: 'Сопровождать скрытые действия звуком голоса персонажа.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_AIRPUMP: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Air Pump Ambient Noise',
  category: 'SOUNDS',
  description: 'Enable hearing air vent humming.',
  */
  name: 'Гул вентиляции',
  category: 'ЗВУКИ',
  description: 'Слышать звуки вентиляции.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_OLDDOORS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Old Door Sounds',
  category: 'SOUNDS',
  description: 'Switch to old door sounds.',
  */
  name: 'Старые звуки шлюзов',
  category: 'ЗВУКИ',
  description: 'Воспроизводить старые звуки открытия и закрытия шлюзов.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_DEPARTMENTDOORS: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Department Door Sounds',
  category: 'SOUNDS',
  description: 'Enable hearing department-specific door sounds.',
  */
  name: 'Звуки шлюзов отделов',
  category: 'ЗВУКИ',
  description: 'Воспроизводить уникальные звуки шлюзов в разных отделах.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_PICKED: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Picked-Up Item Sounds',
  category: 'SOUNDS',
  description: 'Enable hearing a sound when items are picked up.',
  */
  name: 'Звуки при взятии предметов',
  category: 'ЗВУКИ',
  description: 'Слышать звуки при взятии предметов в руку.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_DROPPED: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Dropped Item Sounds',
  category: 'SOUNDS',
  description: 'Enable hearing a sound when items are dropped.',
  */
  name: 'Звуки при опускании предметов',
  category: 'ЗВУКИ',
  description: 'Слышать звуки при отпускании предметов из рук.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_WEATHER: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Weather Sounds',
  category: 'SOUNDS',
  description: 'Enable hearing weather sounds while on a planet.',
  */
  name: 'Звуки погоды',
  category: 'ЗВУКИ',
  description: 'Слышать звуки погоды при нахождении на поверхности планеты.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_SUPERMATTER: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Supermatter Hum',
  category: 'SOUNDS',
  description: 'Enable hearing supermatter hums.',
  */
  name: 'Гул суперматерии',
  category: 'ЗВУКИ',
  description: 'Слышать гул кристалла суперматерии.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const SOUND_MENTORHELP: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Mentorhelp Pings',
  category: 'SOUNDS',
  description: 'Enable hearing mentorhelp pings.',
  */
  name: 'Звуки уведомлений Помощи ментора',
  category: 'ЗВУКИ',
  description: 'Слышать звуки уведомлений о сообщениях Помощи ментора.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

// Vorey sounds
export const BELCH_NOISES: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Belch Noises',
  category: 'SOUNDS',
  description: 'Enable hearing burping noises.',
  */
  name: 'Звуки отрыжек',
  category: 'ЗВУКИ',
  description: 'Слышать звуки отрыжек.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const EATING_NOISES: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Eating Noises',
  category: 'SOUNDS',
  description: 'Enable hearing vore eating noises.',
  */
  name: 'Звуки поедания',
  category: 'ЗВУКИ',
  description: 'Слышать звуки поедания при Vore.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};

export const DIGEST_NOISES: FeatureToggle = {
  /* Bastion of Endeavor Translation
  name: 'Digestion Noises',
  category: 'SOUNDS',
  description: 'Enable hearing vore digestion noises.',
  */
  name: 'Звуки переваривания',
  category: 'ЗВУКИ',
  description: 'Слышать звуки переваривания при Vore.',
  // End of Bastion of Endeavor Translation
  component: CheckboxInput,
};
