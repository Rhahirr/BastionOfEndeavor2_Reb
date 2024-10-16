export enum Gender {
  Male = 'male',
  Female = 'female',
  Other = 'plural',
  Other2 = 'neuter',
}

export const GENDERS = {
  [Gender.Male]: {
    icon: 'mars',
    /* Bastion of Endeavor Translation
    text: 'He/Him',
    */
    text: 'Он/Его',
    /* End of Bastion of Endeavor Translation */
  },

  [Gender.Female]: {
    icon: 'venus',
    /* Bastion of Endeavor Translation
    text: 'She/Her',
    */
    text: 'Она/Её',
    /* End of Bastion of Endeavor Translation */
  },

  [Gender.Other]: {
    icon: 'transgender',
    /* Bastion of Endeavor Translation
    text: 'They/Them',
    */
    text: 'Они/Их',
    /* End of Bastion of Endeavor Translation */
  },

  [Gender.Other2]: {
    icon: 'neuter',
    /* Bastion of Endeavor Translation
    text: 'It/Its',
    */
    text: 'Оно/Его',
    /* End of Bastion of Endeavor Translation */
  },
};
