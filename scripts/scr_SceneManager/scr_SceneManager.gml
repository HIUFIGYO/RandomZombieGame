///@function RoomGoto(room)

function RoomGoto(_room)
{
	SceneManager.isChangingRoom = true;
	SceneManager.scene = _room;
}