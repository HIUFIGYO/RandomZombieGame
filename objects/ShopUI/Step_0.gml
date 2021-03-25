if(!hasControl)
	exit;
	
//calculate reload cost
if(recalculateReloadCost)
{
	recalculateReloadCost = false;
	reloadCost[0] = 0;
	reloadCost[1] = 0;
	reloadCostGrenade = 0;
	var item, _size, _maxSize;

	for(var i=0; i<2; i++)
	{
		item = player.weapon[i];
		if(item != noone)
		{
			_size = player.mag[i] + player.ammo[i];
			_maxSize = GetMaxMag(player, i) + GetMaxAmmo(player, i);
			if(_maxSize != 0)
				reloadCost[i] = (1 - (_size / _maxSize)) * ShopGetSellPrice(item);
		}
	}
	
	item = player.grenadeType;
	if(item != noone)
	{
		_size = player.grenadeAmount;
		_maxSize = GetMaxGrenades(player);
		if(_maxSize != 0)
			reloadCostGrenade = (1 - (_size / _maxSize)) * ShopGetSellPrice(item);
	}
}

//close shop
if(InputGetButtonDown(player.player_inputID, Button.Cancel))
	HUDCloseShop(player);
	
//refill ammo
if(InputGetButtonDown(player.player_inputID, Button.Reload))
{
	recalculateReloadCost = true;
	
	for(var i=0; i<2; i++)
	{
		if(reloadCost[i] > 0 and PlayerGetMoney(player) >= reloadCost[i])
		{
			PlayerSpendMoney(player, reloadCost[i]);
			player.mag[i] = GetMaxMag(player, i);
			player.ammo[i] = GetMaxAmmo(player, i);
		}
	}
	
	if(reloadCostGrenade > 0 and PlayerGetMoney(player) >= reloadCostGrenade)
	{
		PlayerSpendMoney(player, reloadCostGrenade);
		player.grenadeAmount = GetMaxGrenades(player);
	}
}
	
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
	
	ShopSetDescription(id);
}

//list select
if(InputGetButtonUp(player.player_inputID, Button.Down) or InputGetButtonUp(player.player_inputID, Button.Up))
	listButtonDown = false;

var yInput = InputGetButtonDown(player.player_inputID, Button.Down)-InputGetButtonDown(player.player_inputID, Button.Up);

if(yInput != 0)
{
	listButtonDown = true;
	listTimer = 0;
	listSelect += yInput;
	var size = ds_list_size(itemList[tabSelect]) - 1;
	if(listSelect < 0)
		listSelect = size;
	if(listSelect > size)
		listSelect = 0;
	ShopSetDescription(id);
}

if(listButtonDown)
{
	if(listTimer < 0.5)
	{
		listTimer += DeltaTimeSecond();
	}
	else
	{
		listTimer += DeltaTimeSecond();
		if(listTimer > 0.6)
		{
			listTimer = 0.5;
			listSelect += InputGetButton(player.player_inputID, Button.Down)-InputGetButton(player.player_inputID, Button.Up);
			var size = ds_list_size(itemList[tabSelect]) - 1;
			if(listSelect < 0)
				listSelect = size;
			if(listSelect > size)
				listSelect = 0;		
			ShopSetDescription(id);
		}
	}
}

//confirm
if(InputGetButtonDown(player.player_inputID, Button.Confirm))
{
	ShopProcessSelection(id);
	ShopSetDescription(id);
	recalculateReloadCost = true;
}