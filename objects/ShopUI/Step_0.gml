//close shop
if(InputGetButtonDown(player.player_inputID, Button.Sprint))
	HUDCloseShop(player);
	
//refill ammo
	//TODO: fill this out
	
//switch tabs
var xInput = InputGetButtonDown(player.player_inputID, Button.Right)-InputGetButtonDown(player.player_inputID, Button.Left);

if(xInput != 0)
{	
	tabSelect += xInput;
	if(tabSelect < 0)
		tabSelect = maxTab;
	if(tabSelect > maxTab)
		tabSelect = 0;
	
	while(ds_list_size(itemList[tabSelect]) == 0)
	{
		tabSelect += xInput;
		if(tabSelect < 0)
			tabSelect = maxTab;
		if(tabSelect > maxTab)
			tabSelect = 0;
	}
	
	if(listSelect > ds_list_size(itemList[tabSelect]) - 1)
		listSelect = ds_list_size(itemList[tabSelect]) - 1;
}

//list select
var yInput = InputGetButtonDown(player.player_inputID, Button.Down)-InputGetButtonDown(player.player_inputID, Button.Up);

if(yInput != 0)
{
	listSelect += yInput;
	var size = ds_list_size(itemList[tabSelect]) - 1;
	if(listSelect < 0)
		listSelect = size;
	if(listSelect > size)
		listSelect = 0;
}