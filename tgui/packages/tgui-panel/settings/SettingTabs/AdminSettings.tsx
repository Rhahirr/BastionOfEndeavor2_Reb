import { useDispatch, useSelector } from 'tgui/backend';
import { Button, LabeledList, Section } from 'tgui/components';

import { updateSettings } from '../actions';
import { selectSettings } from '../selectors';

export const AdminSettings = (props) => {
  const dispatch = useDispatch();
  const { hideImportantInAdminTab } = useSelector(selectSettings);
  return (
    <Section>
      <LabeledList>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Hide Important messages in admin only tabs">
        */}
        <LabeledList.Item label="Скрывать важные сообщения во вкладках администрации">
          {/* End of Bastion of Endeavor Translation */}
          <Button.Checkbox
            checked={hideImportantInAdminTab}
            /* Bastion of Endeavor Translation
            tooltip="Enabling this will hide all important messages in admin filter exclusive tabs."
            */
            tooltip="Позволяет скрывать все важные сообщения в вкладках только с фильтрами для администрации."
            /* End of Bastion of Endeavor Translation */
            mr="5px"
            onClick={() =>
              dispatch(
                updateSettings({
                  hideImportantInAdminTab: !hideImportantInAdminTab,
                }),
              )
            }
          />
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
