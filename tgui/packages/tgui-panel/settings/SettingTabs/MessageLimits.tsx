import { toFixed } from 'common/math';
import { useDispatch, useSelector } from 'tgui/backend';
import { Box, LabeledList, NumberInput, Section } from 'tgui/components';

import { updateSettings } from '../actions';
import { selectSettings } from '../selectors';

export const MessageLimits = (props) => {
  const dispatch = useDispatch();
  const {
    visibleMessageLimit,
    persistentMessageLimit,
    combineMessageLimit,
    combineIntervalLimit,
    saveInterval,
  } = useSelector(selectSettings);
  return (
    <Section>
      <LabeledList>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Amount of lines to display 500-10000 (Default: 2500)">
        */}
        <LabeledList.Item label="Количество отображаемых строк от 500 до 10000 (по умочлчанию: 2500)">
          {/* End of Bastion of Endeavor Translation */}
          <NumberInput
            width="5em"
            step={100}
            stepPixelSize={2}
            minValue={500}
            maxValue={10000}
            value={visibleMessageLimit}
            format={(value) => toFixed(value)}
            onDrag={(value) =>
              dispatch(
                updateSettings({
                  visibleMessageLimit: value,
                }),
              )
            }
          />
          &nbsp;
          {visibleMessageLimit >= 5000 ? (
            <Box inline fontSize="0.9em" color="red">
              {/* Bastion of Endeavor Translation
              Impacts performance!
              */}
              Влияет на производительность!
              {/* End of Bastion of Endeavor Translation */}
            </Box>
          ) : (
            ''
          )}
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Amount of visually persistent lines 0-10000 (Default: 1000)">
        */}
        <LabeledList.Item label="Количество сохраняемых визуально строчек от 0 до 10000 (по умолчанию: 1000)">
          {/* End of Bastion of Endeavor Translation */}
          <NumberInput
            width="5em"
            step={100}
            stepPixelSize={2}
            minValue={0}
            maxValue={10000}
            value={persistentMessageLimit}
            format={(value) => toFixed(value)}
            onDrag={(value) =>
              dispatch(
                updateSettings({
                  persistentMessageLimit: value,
                }),
              )
            }
          />
          &nbsp;
          {persistentMessageLimit >= 2500 ? (
            <Box inline fontSize="0.9em" color="red">
              {/* Bastion of Endeavor Translation
              Delays initialization!
              */}
              Замедляет инициализацию!
              {/* End of Bastion of Endeavor Translation */}
            </Box>
          ) : (
            ''
          )}
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Amount of different lines in-between to combine 0-10 (Default: 5)">
        */}
        <LabeledList.Item label="Диапазон для объединения идентичных строк от 0 до 10 (по умолчанию: 5)">
          {/* End of Bastion of Endeavor Translation */}
          <NumberInput
            width="5em"
            step={1}
            stepPixelSize={10}
            minValue={0}
            maxValue={10}
            value={combineMessageLimit}
            format={(value) => toFixed(value)}
            onDrag={(value) =>
              dispatch(
                updateSettings({
                  combineMessageLimit: value,
                }),
              )
            }
          />
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Time to combine messages 0-10 (Default: 5 Seconds)">
        */}
        <LabeledList.Item label="Интервал для объединения идентичных строк от 0 до 10 (по умолчанию: 5 секунд)">
          {/* End of Bastion of Endeavor Translation */}
          <NumberInput
            width="5em"
            step={1}
            stepPixelSize={10}
            minValue={0}
            maxValue={10}
            value={combineIntervalLimit}
            /* Bastion of Endeavor Translation
            unit="s"
            */
            unit="сек"
            /* End of Bastion of Endeavor Translation */
            format={(value) => toFixed(value)}
            onDrag={(value) =>
              dispatch(
                updateSettings({
                  combineIntervalLimit: value,
                }),
              )
            }
          />
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Message store interval 1-10 (Default: 10 Seconds) [Requires restart]">
       */}
        <LabeledList.Item label="Интервал сохранения сообщений от 1 до 10 (по умолчанию: 10 секунд) [требует перезапуск]">
          {/* End of Bastion of Endeavor Translation */}
          <NumberInput
            width="5em"
            step={1}
            stepPixelSize={5}
            minValue={1}
            maxValue={10}
            value={saveInterval}
            /* Bastion of Endeavor Translation
            unit="s"
            */
            unit="сек"
            /* End of Bastion of Endeavor Translation */
            format={(value) => toFixed(value)}
            onDrag={(value) =>
              dispatch(
                updateSettings({
                  saveInterval: value,
                }),
              )
            }
          />
          &nbsp;
          {saveInterval <= 3 ? (
            <Box inline fontSize="0.9em" color="red">
              {/* Bastion of Endeavor Translation
              Warning, experimental! Might crash!
              */}
              Может вызвать вылет!
              {/* End of Bastion of Endeavor Translation */}
            </Box>
          ) : (
            ''
          )}
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
