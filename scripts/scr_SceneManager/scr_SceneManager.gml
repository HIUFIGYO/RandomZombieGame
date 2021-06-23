///@function RoomGoto(room)

function RoomGoto(_room)
{
	SceneManager.fadeOut = true;
	SceneManager.fader = 0;
	SceneManager.isChangingRoom = true;
	SceneManager.scene = _room;
}