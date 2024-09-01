import { toFixed } from 'common/math';
import { useState } from 'react';
import { useDispatch, useSelector } from 'tgui/backend';
import {
  Box,
  Button,
  ColorBox,
  Dropdown,
  Input,
  LabeledList,
  NumberInput,
  Section,
  Stack,
} from 'tgui/components';

import { rebuildChat } from '../../chat/actions';
import { THEMES } from '../../themes';
import { updateSettings } from '../actions';
import { FONTS } from '../constants';
import { selectSettings } from '../selectors';

export const SettingsGeneral = (props) => {
  const {
    theme,
    fontFamily,
    fontSize,
    lineHeight,
    showReconnectWarning,
    prependTimestamps,
    interleave,
    interleaveColor,
  } = useSelector(selectSettings);
  const dispatch = useDispatch();
  const [freeFont, setFreeFont] = useState(false);
  return (
    <Section>
      <LabeledList>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Theme">
        */}
        <LabeledList.Item label="Тема">
          {/* End of Bastion of Endeavor Translation */}
          <Dropdown
            autoScroll={false}
            width="175px"
            selected={theme}
            options={THEMES}
            onSelected={(value) =>
              dispatch(
                updateSettings({
                  theme: value,
                }),
              )
            }
          />
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Font style">
        */}
        <LabeledList.Item label="Шрифт">
          {/* End of Bastion of Endeavor Translation */}
          <Stack inline align="baseline">
            <Stack.Item>
              {(!freeFont && (
                <Dropdown
                  autoScroll={false}
                  width="175px"
                  selected={fontFamily}
                  options={FONTS}
                  onSelected={(value) =>
                    dispatch(
                      updateSettings({
                        fontFamily: value,
                      }),
                    )
                  }
                />
              )) || (
                <Input
                  value={fontFamily}
                  onChange={(e, value) =>
                    dispatch(
                      updateSettings({
                        fontFamily: value,
                      }),
                    )
                  }
                />
              )}
            </Stack.Item>
            <Stack.Item>
              <Button
                icon={freeFont ? 'lock-open' : 'lock'}
                color={freeFont ? 'good' : 'bad'}
                ml={1}
                onClick={() => {
                  setFreeFont(!freeFont);
                }}
              >
                {/* Bastion of Endeavor Translation
                Custom font
                */}
                Особый
                {/* End of Bastion of Endeavor Translation */}
              </Button>
            </Stack.Item>
          </Stack>
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Font size">
        */}
        <LabeledList.Item label="Размер шрифта">
          {/* End of Bastion of Endeavor Translation */}
          <NumberInput
            width="4em"
            step={1}
            stepPixelSize={10}
            minValue={8}
            maxValue={32}
            value={fontSize}
            /* Bastion of Endeavor Translation
            unit="px"
            */
            unit="пт"
            /* End of Bastion of Endeavor Translation */
            format={(value) => toFixed(value)}
            onChange={(value) =>
              dispatch(
                updateSettings({
                  fontSize: value,
                }),
              )
            }
          />
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Line height">
        */}
        <LabeledList.Item label="Высота строки">
          {/* End of Bastion of Endeavor Translation */}
          <NumberInput
            width="4em"
            step={0.01}
            stepPixelSize={2}
            minValue={0.8}
            maxValue={5}
            value={lineHeight}
            format={(value) => toFixed(value, 2)}
            onDrag={(value) =>
              dispatch(
                updateSettings({
                  lineHeight: value,
                }),
              )
            }
          />
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Enable disconnection/afk warning">
        */}
        <LabeledList.Item label="Отображать уведомление о неактивности/отключении">
          {/* End of Bastion of Endeavor Translation */}
          <Button.Checkbox
            checked={showReconnectWarning}
            /* Bastion of Endeavor Translation
            tooltip="Unchecking this will disable the red afk/reconnection warning bar at the bottom of the chat."
            */
            tooltip="При снятии галочки вы больше не будете получать уведомление об отсоединении от сервера."
            /* End of Bastion of Endeavor Translation */
            mr="5px"
            onClick={() =>
              dispatch(
                updateSettings({
                  showReconnectWarning: !showReconnectWarning,
                }),
              )
            }
          />
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Interleave messages">
        */}
        <LabeledList.Item label="Чередовать фон сообщений">
          {/* End of Bastion of Endeavor Translation */}
          <Button.Checkbox
            checked={interleave}
            /* Bastion of Endeavor Translation
            tooltip="Enabling this will interleave messages."
           */
            tooltip="При включенной настройке фон сообщений будет чередовать цвет."
            /* End of Bastion of Endeavor Translation */
            mr="5px"
            onClick={() =>
              dispatch(
                updateSettings({
                  interleave: !interleave,
                }),
              )
            }
          />
          <Box inline>
            <ColorBox mr={1} color={interleaveColor} />
            <Input
              width="5em"
              monospace
              placeholder="#ffffff"
              value={interleaveColor}
              onInput={(e, value) =>
                dispatch(
                  updateSettings({
                    interleaveColor: value,
                  }),
                )
              }
            />
          </Box>
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Enable chat timestamps">
       */}
        <LabeledList.Item label="Отметки времени">
          {/* End of Bastion of Endeavor Translation */}
          <Button.Checkbox
            checked={prependTimestamps}
            /* Bastion of Endeavor Translation
            tooltip="Enabling this will prepend timestamps to all messages."
           */
            tooltip="При включенной настройке перед сообщениями будет отображаться отметка времени отправки."
            mr="5px"
            onClick={() =>
              dispatch(
                updateSettings({
                  prependTimestamps: !prependTimestamps,
                }),
              )
            }
          />
          <Box inline>
            <Button icon="check" onClick={() => dispatch(rebuildChat())}>
              {/* Bastion of Endeavor Translation
              Apply now
              */}
              Применить
              {/* End of Bastion of Endeavor Translation */}
            </Button>
            <Box inline fontSize="0.9em" ml={1} color="label">
              {/* Bastion of Endeavor Translation
              Can freeze the chat for a while.
              */}
              Может вызвать подвисание.
              {/* End of Bastion of Endeavor Translation */}
            </Box>
          </Box>
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
