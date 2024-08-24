import { useBackend } from '../../backend';
import { Button, Flex, NoticeBox } from '../../components';

/**
 * This component by expects the following fields to be returned
 * from ui_data:
 *
 * - siliconUser: boolean
 * - locked: boolean
 *
 * And expects the following ui_act action to be implemented:
 *
 * - lock - for toggling the lock as a silicon user.
 *
 * All props can be redefined if you want custom behavior, but
 * it's preferred to stick to defaults.
 */
export const InterfaceLockNoticeBox = (props) => {
  const { act, data } = useBackend();
  const {
    siliconUser = data.siliconUser,
    locked = data.locked,
    onLockStatusChange = () => act('lock'),
    /* Bastion of Endeavor Translation
    accessText = 'an ID card',
    */
    accessText = 'идентификационной картой',
    /* End of Bastion of Endeavor Translation */
    preventLocking = data.preventLocking,
  } = props;
  // For silicon users
  if (siliconUser) {
    return (
      <NoticeBox color="grey">
        <Flex align="center">
          {/* Bastion of Endeavor Translation
          <Flex.Item>Interface lock status:</Flex.Item>
          */}
          <Flex.Item>Блокировка интерфейса:</Flex.Item>
          {/* End of Bastion of Endeavor Translation */}
          <Flex.Item grow={1} />
          <Flex.Item>
            <Button
              m={0}
              color={locked ? 'red' : 'green'}
              icon={locked ? 'lock' : 'unlock'}
              disabled={preventLocking}
              onClick={() => {
                if (onLockStatusChange) {
                  onLockStatusChange(!locked);
                }
              }}
            >
              {/* Bastion of Endeavor Translation
              {locked ? 'Locked' : 'Unlocked'}
              */}
              {locked ? 'Активна' : 'Отключена'}
              {/* End of Bastion of Endeavor Translation */}
            </Button>
          </Flex.Item>
        </Flex>
      </NoticeBox>
    );
  }
  // For everyone else
  return (
    <NoticeBox>
      {/* Bastion of Endeavor Translation
      Swipe {accessText} to {locked ? 'unlock' : 'lock'} this interface.
      */}
      Проведите {accessText}, чтобы
      {locked ? 'заблокировать' : 'разблокировать'} этот интерфейс.
      {/* End of Bastion of Endeavor Translation */}
    </NoticeBox>
  );
};
