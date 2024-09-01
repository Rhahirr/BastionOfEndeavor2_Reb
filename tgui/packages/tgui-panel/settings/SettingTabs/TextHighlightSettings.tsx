import { useDispatch, useSelector } from 'tgui/backend';
import {
  Box,
  Button,
  ColorBox,
  Divider,
  Flex,
  Input,
  Section,
  TextArea,
} from 'tgui/components';

import { rebuildChat } from '../../chat/actions';
import {
  addHighlightSetting,
  removeHighlightSetting,
  updateHighlightSetting,
} from '../actions';
import { MAX_HIGHLIGHT_SETTINGS } from '../constants';
import {
  selectHighlightSettingById,
  selectHighlightSettings,
} from '../selectors';

export const TextHighlightSettings = (props) => {
  const highlightSettings = useSelector(selectHighlightSettings);
  const dispatch = useDispatch();
  return (
    <Section fill scrollable height="235px">
      <Section p={0}>
        <Flex direction="column">
          {highlightSettings.map((id, i) => (
            <TextHighlightSetting
              key={i}
              id={id}
              mb={i + 1 === highlightSettings.length ? 0 : '10px'}
            />
          ))}
          {highlightSettings.length < MAX_HIGHLIGHT_SETTINGS && (
            <Flex.Item>
              <Button
                color="transparent"
                icon="plus"
                onClick={() => {
                  dispatch(addHighlightSetting());
                }}
              >
                {/* Bastion of Endeavor Translation
                Add Highlight Setting
                */}
                Добавить критерии выделения
                {/* End of Bastion of Endeavor Translation */}
              </Button>
            </Flex.Item>
          )}
        </Flex>
      </Section>
      <Divider />
      <Box>
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
    </Section>
  );
};

const TextHighlightSetting = (props) => {
  const { id, ...rest } = props;
  const highlightSettingById = useSelector(selectHighlightSettingById);
  const dispatch = useDispatch();
  const {
    highlightColor,
    highlightText,
    blacklistText,
    highlightWholeMessage,
    highlightBlacklist,
    matchWord,
    matchCase,
  } = highlightSettingById[id];
  return (
    <Flex.Item {...rest}>
      <Flex mb={1} color="label" align="baseline">
        <Flex.Item grow>
          <Button
            color="transparent"
            icon="times"
            onClick={() =>
              dispatch(
                removeHighlightSetting({
                  id: id,
                }),
              )
            }
          >
            {/* Bastion of Endeavor Translation
            Delete
            */}
            Удалить
            {/* End of Bastion of Endeavor Translation */}
          </Button>
        </Flex.Item>
        <Flex.Item>
          <Button.Checkbox
            checked={highlightBlacklist}
            /* Bastion of Endeavor Translation
            tooltip="If this option is selected, you can blacklist senders not to highlight their messages."
            */
            tooltip="Позволяет указать отправителей, сообщения которых не будут выделяться."
            /* End of Bastion of Endeavor Translation */
            mr="5px"
            onClick={() =>
              dispatch(
                updateHighlightSetting({
                  id: id,
                  highlightBlacklist: !highlightBlacklist,
                }),
              )
            }
          >
            {/* Bastion of Endeavor Translation
            Highlight Blacklist
            */}
            Исключения
            {/* End of Bastion of Endeavor Translation */}
          </Button.Checkbox>
        </Flex.Item>
        <Flex.Item>
          <Button.Checkbox
            checked={highlightWholeMessage}
            /* Bastion of Endeavor Translation
            tooltip="If this option is selected, the entire message will be highlighted in yellow."
            */
            tooltip="Позволяет выделять всё сообщение целиком."
            /* End of Bastion of Endeavor Translation */
            mr="5px"
            onClick={() =>
              dispatch(
                updateHighlightSetting({
                  id: id,
                  highlightWholeMessage: !highlightWholeMessage,
                }),
              )
            }
          >
            {/* Bastion of Endeavor Translation
            Whole Message
            */}
            Выделять целиком
            {/* End of Bastion of Endeavor Translation */}
          </Button.Checkbox>
        </Flex.Item>
        <Flex.Item>
          <Button.Checkbox
            checked={matchWord}
            tooltipPosition="bottom-start"
            /* Bastion of Endeavor Translation
            tooltip="If this option is selected, only exact matches (no extra letters before or after) will trigger. Not compatible with punctuation. Overriden if regex is used."
            */
            tooltip="Позволяет выделять сообщения только при точном совпадении. Несовместимо с пунктуацией. Не обладает приоритетом над регулярными выражениями."
            /* End of Bastion of Endeavor Translation */
            onClick={() =>
              dispatch(
                updateHighlightSetting({
                  id: id,
                  matchWord: !matchWord,
                }),
              )
            }
          >
            {/* Bastion of Endeavor Translation
            Exact
            */}
            Точное совпадение
            {/* End of Bastion of Endeavor Translation */}
          </Button.Checkbox>
        </Flex.Item>
        <Flex.Item>
          <Button.Checkbox
            /* Bastion of Endeavor Translation
            tooltip="If this option is selected, the highlight will be case-sensitive."
            */
            tooltip="Переключает чувствительность к регистру текста."
            checked={matchCase}
            onClick={() =>
              dispatch(
                updateHighlightSetting({
                  id: id,
                  matchCase: !matchCase,
                }),
              )
            }
          >
            {/* Bastion of Endeavor Translation
            Case
            */}
            Регистр
            {/* End of Bastion of Endeavor Translation */}
          </Button.Checkbox>
        </Flex.Item>
        <Flex.Item shrink={0}>
          <ColorBox mr={1} color={highlightColor} />
          <Input
            width="5em"
            monospace
            placeholder="#ffffff"
            value={highlightColor}
            onInput={(e, value) =>
              dispatch(
                updateHighlightSetting({
                  id: id,
                  highlightColor: value,
                }),
              )
            }
          />
        </Flex.Item>
      </Flex>
      <TextArea
        height="3em"
        value={highlightText}
        /* Bastion of Endeavor Translation
        placeholder="Put words to highlight here. Separate terms with commas, i.e. (term1, term2, term3)"
        */
        placeholder="Введите слова, которые должны выделяться в чате. Разделяйте их запятыми (слово1, слово2, слово3)."
        /* End of Bastion of Endeavor Translation */
        onChange={(e, value) =>
          dispatch(
            updateHighlightSetting({
              id: id,
              highlightText: value,
            }),
          )
        }
      />
      {highlightBlacklist ? (
        <TextArea
          height="3em"
          value={blacklistText}
          /* Bastion of Endeavor Translation
          placeholder="Put names of senders you don't want highlighted here. Separate names with commas, i.e. (name1, name2, name3)"
          */
          placeholder="Введите имена отправителей, чьи сообщения не должны выделяться. Разделяйте их запятыми (слово1, слово2, слово3)."
          /* End of Bastion of Endeavor Translation */
          onChange={(e, value) =>
            dispatch(
              updateHighlightSetting({
                id: id,
                blacklistText: value,
              }),
            )
          }
        />
      ) : (
        ''
      )}
    </Flex.Item>
  );
};
