import { toFixed } from 'common/math';
import { useState } from 'react';
import { useDispatch, useSelector } from 'tgui/backend';
import {
  Box,
  Button,
  Collapsible,
  Divider,
  Flex,
  LabeledList,
  NumberInput,
  Section,
} from 'tgui/components';

import { purgeChatMessageArchive, saveChatToDisk } from '../../chat/actions';
import { MESSAGE_TYPES } from '../../chat/constants';
import { useGame } from '../../game';
import { updateSettings, updateToggle } from '../actions';
import { selectSettings } from '../selectors';

export const ExportTab = (props) => {
  const dispatch = useDispatch();
  const game = useGame();
  const {
    storedRounds,
    exportStart,
    exportEnd,
    logRetainRounds,
    logEnable,
    logLineCount,
    logLimit,
    totalStoredMessages,
    storedTypes,
  } = useSelector(selectSettings);
  const [purgeConfirm, setPurgeConfirm] = useState(0);
  const [logConfirm, setLogConfirm] = useState(false);
  return (
    <Section>
      <Flex align="baseline">
        {logEnable ? (
          logConfirm ? (
            <Button
              icon="ban"
              color="red"
              onClick={() => {
                dispatch(
                  updateSettings({
                    logEnable: false,
                  }),
                );
                setLogConfirm(false);
              }}
            >
              {/* Bastion of Endeavor Translation
              Disable?
              */}
              Действительно отключить сохранение истории?
              {/* End of Bastion of Endeavor Translation */}
            </Button>
          ) : (
            <Button
              icon="ban"
              color="red"
              onClick={() => {
                setLogConfirm(true);
                setTimeout(() => {
                  setLogConfirm(false);
                }, 5000);
              }}
            >
              {/* Bastion of Endeavor Translation
              Disable logging
              */}
              Отключить сохранение истории
              {/* End of Bastion of Endeavor Translation */}
            </Button>
          )
        ) : (
          <Button
            icon="download"
            color="green"
            onClick={() => {
              dispatch(
                updateSettings({
                  logEnable: true,
                }),
              );
            }}
          >
            {/* Bastion of Endeavor Translation
            Enable logging
            */}
            Включить сохранение истории
            {/* End of Bastion of Endeavor Translation */}
          </Button>
        )}
        <Flex.Item grow={1} />
        {/* Bastion of Endeavor Translation
        <Flex.Item color="label">Round ID:&nbsp;</Flex.Item>
        <Flex.Item color={game.roundId ? '' : 'red'}>
          {game.roundId ? game.roundId : 'ERROR'}
        */}
        <Flex.Item color="label">ID раунда:&nbsp;</Flex.Item>
        <Flex.Item color={game.roundId ? '' : 'red'}>
          {game.roundId ? game.roundId : 'Ошибка'}
          {/* End of Bastion of Endeavor Translation */}
        </Flex.Item>
      </Flex>
      {logEnable ? (
        <>
          <LabeledList>
            {/* Bastion of Endeavor Translation
            <LabeledList.Item label="Amount of rounds to log (1 to 8)">
            */}
            <LabeledList.Item label="Количество сохраняемых раундов (от 1 до 8)">
              {/* End of Bastion of Endeavor Translation */}
              <NumberInput
                width="5em"
                step={1}
                stepPixelSize={10}
                minValue={1}
                maxValue={8}
                value={logRetainRounds}
                format={(value) => toFixed(value)}
                onDrag={(value) =>
                  dispatch(
                    updateSettings({
                      logRetainRounds: value,
                    }),
                  )
                }
              />
              &nbsp;
              {logRetainRounds > 3 ? (
                <Box inline fontSize="0.9em" color="red">
                  {/* Bastion of Endeavor Translation
                  Warning, might crash!
                  */}
                  Внимание, может привести к вылетам!
                  {/* End of Bastion of Endeavor Translation */}
                </Box>
              ) : (
                ''
              )}
            </LabeledList.Item>
            {/* Bastion of Endeavor Translation
            <LabeledList.Item label="Hardlimit for the log archive (0 = inf. to 50000)">
            */}
            <LabeledList.Item label="Лимит архива логирования (0 = нет лимита, до 50000)">
              {/* End of Bastion of Endeavor Translation */}
              <NumberInput
                width="5em"
                step={500}
                stepPixelSize={10}
                minValue={0}
                maxValue={50000}
                value={logLimit}
                format={(value) => toFixed(value)}
                onDrag={(value) =>
                  dispatch(
                    updateSettings({
                      logLimit: value,
                    }),
                  )
                }
              />
              &nbsp;
              {logLimit > 0 ? (
                <Box
                  inline
                  fontSize="0.9em"
                  color={logLimit > 10000 ? 'red' : 'label'}
                >
                  {/* Bastion of Endeavor Translation
                  {logLimit > 15000
                    ? 'Warning, might crash! Takes priority above round retention.'
                    : 'Takes priority above round retention.'}
                  */}
                  {logLimit > 15000
                    ? 'Может привести к вылетам! Приоритет над количеством раундов.'
                    : 'Приоритет над количеством раундов.'}
                  {/* End of Bastion of Endeavor Translation */}
                </Box>
              ) : (
                ''
              )}
            </LabeledList.Item>
          </LabeledList>
          <Section>
            {/* Bastion of Endeavor Translation
            <Collapsible mt={1} color="transparent" title="Messages to log">
            */}
            <Collapsible
              mt={1}
              color="transparent"
              title="Сохраняемые сообщения"
            >
              {/* End of Bastion of Endeavor Translation */}
              {MESSAGE_TYPES.map((typeDef) => (
                <Button.Checkbox
                  key={typeDef.type}
                  checked={storedTypes[typeDef.type]}
                  onClick={() =>
                    dispatch(
                      updateToggle({
                        type: typeDef.type,
                      }),
                    )
                  }
                >
                  {typeDef.name}
                </Button.Checkbox>
              ))}
            </Collapsible>
          </Section>
        </>
      ) : (
        ''
      )}
      <LabeledList>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Export round start (0 = curr.) / end (0 = dis.)">
        */}
        <LabeledList.Item label="Экспортировать раунды от (0 = текущий) / до (0 = отключить)">
          {/* End of Bastion of Endeavor Translation */}
          <NumberInput
            width="5em"
            step={1}
            stepPixelSize={10}
            minValue={0}
            maxValue={exportEnd === 0 ? 0 : exportEnd - 1}
            value={exportStart}
            format={(value) => toFixed(value)}
            onDrag={(value) =>
              dispatch(
                updateSettings({
                  exportStart: value,
                }),
              )
            }
          />
          <NumberInput
            width="5em"
            step={1}
            stepPixelSize={10}
            minValue={exportStart === 0 ? 0 : exportStart + 1}
            maxValue={storedRounds}
            value={exportEnd}
            format={(value) => toFixed(value)}
            onDrag={(value) =>
              dispatch(
                updateSettings({
                  exportEnd: value,
                }),
              )
            }
          />
          &nbsp;
          <Box inline fontSize="0.9em" color="label">
            {/* Bastion of Endeavor Translation
            Stored Rounds:&nbsp;
            */}
            Сохранено раундов:&nbsp;
            {/* End of Bastion of Endeavor Translation */}
          </Box>
          <Box inline>{storedRounds}</Box>
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Amount of lines to export (0 = inf.)">
        */}
        <LabeledList.Item label="Количество экспортируемых строк (0 = бесконечно)">
          {/* End of Bastion of Endeavor Translation */}
          <NumberInput
            width="5em"
            step={100}
            stepPixelSize={10}
            minValue={0}
            maxValue={50000}
            value={logLineCount}
            format={(value) => toFixed(value)}
            onDrag={(value) =>
              dispatch(
                updateSettings({
                  logLineCount: value,
                }),
              )
            }
          />
        </LabeledList.Item>
        {/* Bastion of Endeavor Translation
        <LabeledList.Item label="Totally stored messages">
        */}
        <LabeledList.Item label="Всего сохранено сообщений">
          {/* End of Bastion of Endeavor Translation */}
          <Box>{totalStoredMessages}</Box>
        </LabeledList.Item>
      </LabeledList>
      <Divider />
      <Button icon="save" onClick={() => dispatch(saveChatToDisk())}>
        {/* Bastion of Endeavor Translation
        Save chat log
        */}
        Экспортировать историю чата
        {/* End of Bastion of Endeavor Translation */}
      </Button>
      {purgeConfirm > 0 ? (
        <Button
          icon="trash"
          color="red"
          onClick={() => {
            dispatch(purgeChatMessageArchive());
            setPurgeConfirm(2);
          }}
        >
          {/* Bastion of Endeavor Translation
          {purgeConfirm > 1 ? 'Purged!' : 'Are you sure?'}
          */}
          {purgeConfirm > 1 ? 'Архив очищен!' : 'Вы уверены?'}
          {/* End of Bastion of Endeavor Translation */}
        </Button>
      ) : (
        <Button
          icon="trash"
          color="red"
          onClick={() => {
            setPurgeConfirm(1);
            setTimeout(() => {
              setPurgeConfirm(0);
            }, 5000);
          }}
        >
          {/* Bastion of Endeavor Translation
          Purge message archive
          */}
          Очистить архив сообщений
          {/* End of Bastion of Endeavor Translation */}
        </Button>
      )}
    </Section>
  );
};
