import { useDispatch } from 'tgui/backend';
import { Button } from 'tgui/components';

import { dismissWarning } from './game/actions';

let url: string | null = null;

setInterval(() => {
  Byond.winget('', 'url').then((currentUrl) => {
    // Sometimes, for whatever reason, BYOND will give an IP with a :0 port.
    if (currentUrl && !currentUrl.match(/:0$/)) {
      url = currentUrl;
    }
  });
}, 5000);

export const ReconnectButton = (props) => {
  if (!url) {
    return null;
  }
  const dispatch = useDispatch();
  return (
    <>
      <Button
        color="white"
        onClick={() => {
          Byond.command('.reconnect');
        }}
      >
        {/* Bastion of Endeavor Translation
        Reconnect
        */}
        Переподключиться
        {/* End of Bastion of Endeavor Translation */}
      </Button>
      <Button
        color="white"
        onClick={() => {
          location.href = `byond://${url}`;
          Byond.command('.quit');
        }}
      >
        {/* Bastion of Endeavor Translation
        Relaunch game
        */}
        Перезапустить игру
        {/* End of Bastion of Endeavor Translation */}
      </Button>
      <Button
        color="white"
        onClick={() => {
          dispatch(dismissWarning());
        }}
      >
        {/* Bastion of Endeavor Translation
        Dismiss
        */}
        Скрыть
        {/* End of Bastion of Endeavor Translation */}
      </Button>
    </>
  );
};
