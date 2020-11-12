if(canMove and InputGetButtonDown(player_inputID, Button.Interact))
{
	canMove = false;
	HUDCreateShop(playerID);
}