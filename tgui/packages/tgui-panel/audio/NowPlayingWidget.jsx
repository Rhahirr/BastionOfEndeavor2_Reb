/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { toFixed } from 'common/math';
import { useDispatch, useSelector } from 'tgui/backend';
import { Button, Collapsible, Flex, Knob, Section } from 'tgui/components';

import { useSettings } from '../settings';
import { selectAudio } from './selectors';

export const NowPlayingWidget = (props) => {
  const audio = useSelector(selectAudio),
    dispatch = useDispatch(),
    settings = useSettings(),
    title = audio.meta?.title,
    URL = audio.meta?.link,
    /* Bastion of Endeavor Translation
    Artist = audio.meta?.artist || 'Unknown Artist',
    upload_date = audio.meta?.upload_date || 'Unknown Date',
    album = audio.meta?.album || 'Unknown Album',
    */
    Artist = audio.meta?.artist || 'Неизвестный исполнитель',
    upload_date = audio.meta?.upload_date || 'Неизвестная дата',
    album = audio.meta?.album || 'Неизвестный альбом',
    /* End of Bastion of Endeavor Translation */
    duration = audio.meta?.duration,
    date = !isNaN(upload_date)
      ? upload_date?.substring(0, 4) +
        '-' +
        upload_date?.substring(4, 6) +
        '-' +
        upload_date?.substring(6, 8)
      : upload_date;

  return (
    <Flex align="center">
      {(audio.playing && (
        <Flex.Item
          mx={0.5}
          grow={1}
          style={{
            whiteSpace: 'nowrap',
            overflow: 'hidden',
            textOverflow: 'ellipsis',
          }}
        >
          {
            /* Bastion of Endeavor Translation
            <Collapsible title={title || 'Unknown Track'} color={'blue'}>
            */
            <Collapsible title={title || 'Неизвестный трек'} color={'blue'}>
              {/* End of Bastion of Endeavor Translation */}
              <Section>
                {/* Bastion of Endeavor Translation
                {URL !== 'Song Link Hidden' && (
                */}
                {URL !== 'Ссылка на трек скрыта' && (
                  /* End of Bastion of Endeavor Translation */
                  <Flex.Item grow={1} color="label">
                    {/* Bastion of Endeavor Translation
                    URL: {URL}
                    */}
                    Ссылка: {URL}
                    {/* End of Bastion of Endeavor Translation */}
                  </Flex.Item>
                )}
                <Flex.Item grow={1} color="label">
                  {/* Bastion of Endeavor Translation
                  Duration: {duration}
                  */}
                  Длительность: {duration}
                  {/* End of Bastion of Endeavor Translation */}
                </Flex.Item>
                {/* Bastion of Endeavor Translation
                {Artist !== 'Song Artist Hidden' &&
                  Artist !== 'Unknown Artist' && (
                */}
                {Artist !== 'Исполнитель скрыт' &&
                  Artist !== 'Неизвестный исполнитель' && (
                    /* End of Bastion of Endeavor Translation */
                    <Flex.Item grow={1} color="label">
                      {/* Bastion of Endeavor Translation
                      Artist: {Artist}
                      */}
                      Исполнитель: {Artist}
                      {/* End of Bastion of Endeavor Translation */}
                    </Flex.Item>
                  )}
                {/* Bastion of Endeavor Translation
                {album !== 'Song Album Hidden' && album !== 'Unknown Album' && (
                */}
                {album !== 'Альбом скрыт' && album !== 'Неизвестный альбом' && (
                  /* End of Bastion of Endeavor Translation */
                  <Flex.Item grow={1} color="label">
                    {/* Bastion of Endeavor Translation
                    Album: {album}
                    */}
                    Альбом: {album}
                    {/* End of Bastion of Endeavor Translation */}
                  </Flex.Item>
                )}
                {/* Bastion of Endeavor Translation
                {upload_date !== 'Song Upload Date Hidden' &&
                  upload_date !== 'Unknown Date' && (
                */}
                {upload_date !== 'Дата загрузки трека скрыта' &&
                  upload_date !== 'Неизвестная дата' && (
                    /* End of Bastion of Endeavor Translation */
                    <Flex.Item grow={1} color="label">
                      {/* Bastion of Endeavor Translation
                      Uploaded: {date}
                      */}
                      Загружен: {date}
                      {/* End of Bastion of Endeavor Translation */}
                    </Flex.Item>
                  )}
              </Section>
            </Collapsible>
          }
        </Flex.Item>
      )) || (
        <Flex.Item grow={1} color="label">
          {/* Bastion of Endeavor Translation
          Nothing to play.
          */}
          Ничего не воспроизводится.
          {/* End of Bastion of Endeavor Translation */}
        </Flex.Item>
      )}
      {audio.playing && (
        <Flex.Item mx={0.5} fontSize="0.9em">
          <Button
            /* Bastion of Endeavor Translation
            tooltip="Stop"
            */
            tooltip="Стоп"
            /* End of Bastion of Endeavor Translation */
            icon="stop"
            onClick={() =>
              dispatch({
                type: 'audio/stopMusic',
              })
            }
          />
        </Flex.Item>
      )}
      <Flex.Item mx={0.5} fontSize="0.9em">
        <Knob
          minValue={0}
          maxValue={1}
          value={settings.adminMusicVolume}
          step={0.0025}
          stepPixelSize={1}
          format={(value) => toFixed(value * 100) + '%'}
          onDrag={(e, value) =>
            settings.update({
              adminMusicVolume: value,
            })
          }
        />
      </Flex.Item>
    </Flex>
  );
};
