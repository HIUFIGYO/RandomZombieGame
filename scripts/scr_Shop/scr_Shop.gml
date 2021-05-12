///@function ShopProcessSelection(shop)

function ShopProcessSelection(_shop)
{
	if(_shop.tabSelect == ShopTab.Sell)
		ShopSellItem(_shop);
	else
		ShopBuyItem(_shop);
}

///@function ShopBuyItem(shop)

function ShopBuyItem(_shop)
{
	var item = ShopGetItemID(_shop);
	var restockItem = noone;
	var sellPrice = 0;
	
	if(_shop.tabSelect < ShopTab.Special and ShopGetStock(item) <= 0)
		return;
	
	switch(_shop.tabSelect)
	{
		case ShopTab.Primary:
			sellPrice = ShopGetSellPrice(_shop.player.weapon[0]);
			if(_shop.player.weapon[0] != item and ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				restockItem = _shop.player.weapon[0];
				GiveWeapon(_shop.player, item, 0);
			}
			break;
		case ShopTab.Secondary:
			sellPrice = ShopGetSellPrice(_shop.player.weapon[1]);
			if(_shop.player.weapon[1] != item and ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				restockItem = _shop.player.weapon[1];
				GiveWeapon(_shop.player, item, 1);
			}
			break;
		case ShopTab.Melee:
			sellPrice = ShopGetSellPrice(_shop.player.meleeWeapon);
			if(_shop.player.meleeWeapon != item and ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				restockItem = _shop.player.meleeWeapon;
				GiveMelee(_shop.player, item);
			}
			break;
		case ShopTab.Grenades:
			sellPrice = ShopGetSellPrice(_shop.player.grenadeType);
			if(_shop.player.grenadeType != item and ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				restockItem = _shop.player.grenadeType;
				GiveExplosive(_shop.player, item);
			}
			break;
		case ShopTab.Buffs:
			if(_shop.player.buff[0] == noone and _shop.player.buff[1] != item)
			{
				if(_shop.player.buffCooldown[0] <= 0 and ShopCanAffordAndBuy(_shop.player, item, sellPrice))
				{
					GiveBuff(_shop.player, item, 0);
				}
			}
			else if(_shop.player.buff[1] == noone and _shop.player.buff[0] != item)
			{
				if(_shop.player.buffCooldown[1] <= 0 and ShopCanAffordAndBuy(_shop.player, item, sellPrice))
				{
					GiveBuff(_shop.player, item, 1);
				}
			}
			break;
		case ShopTab.Medical:
			sellPrice = ShopGetSellPrice(_shop.player.healingItem);
			if(_shop.player.healingItem != item and ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				restockItem = _shop.player.healingItem;
				GiveMedical(_shop.player, item);
			}
			break;
		case ShopTab.Vials:
			sellPrice = ShopGetSellPrice(_shop.player.vial);
			if(_shop.player.vial != item and ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				restockItem = _shop.player.vial;
				GiveVial(_shop.player, item);
			}
			break;
		case ShopTab.Support:
			if(item == SupportType.Armour)
			{
				if(_shop.player.armour < _shop.player.maxArmour and ShopCanAffordAndBuy(_shop.player, item, 0))
				{
					GiveArmour(_shop.player);
				}
			}
			else
			{
				sellPrice = ShopGetSellPrice(_shop.player.supportItem);
				if(_shop.player.supportItem != item and ShopCanAffordAndBuy(_shop.player, item, sellPrice))
				{
					restockItem = _shop.player.supportItem;
					GiveSupport(_shop.player, item);
				}
			}
			break;
		case ShopTab.Special:
			if(item == SpecialType.Revive)
			{
				if(ShopCanAffordAndBuy(_shop.player, item, -global.shopID.revivePriceAdd))
				{
					var _player = global.shopID.reviveList[| _shop.listSelect];
					RevivePlayer(_player, GetMaxHealth(_player), 3);
					global.shopID.revivePriceAdd += global.shopID.reviveAddAmount;
					_player.x = _player.xstart;
					_player.y = _player.ystart;
					ShopUpdateSpecials();
				}
			}
			else if(item == SpecialType.Bank)
			{
				if(ShopCanAffordAndBuy(_shop.player, item, 0))
				{
					global.shopID.hasBank = true;
					ShopUpdateSpecials();
				}
			}
			else if(item == SpecialType.CallExtract)
			{
				global.shopID.hasCallExtract[_shop.player.playerID] = true;
				var _count = 0;
				for(var i=0; i<global.playerAmount; i++)
				{
					if(global.shopID.hasCallExtract[i])
						_count++;
				}
				MessageAddAll(_shop.player.name + " has called for extraction: (" + string(_count) + "/" + string(global.playerAmount) + ")", MessageFilter.Notification);
				if(_count == global.playerAmount)
				{
					MessageAddAll("Call Extraction Initiated!", MessageFilter.Notification);
					_shop.hasControl = false;
					with(global.shopID)
						event_perform(ev_other, ev_user0);
					return;
				}
				ShopUpdateSpecials();
			}
			break;
	}
	
	ShopBuildSellList(_shop);
	
	if(restockItem != noone)
		ShopAddStock(restockItem);
}

///@function ShopSellItem(shop)

function ShopSellItem(_shop)
{
	var item = ShopGetItemID(_shop),
		_player = _shop.player;
		
	PlayerGiveMoney(_player, ShopGetSellPrice(item));
		
	if(_player.weapon[0] == item)
		_player.weapon[0] = noone;
	else if(_player.weapon[1] == item)
		_player.weapon[1] = noone;
	else if(_player.meleeWeapon == item)
		_player.meleeWeapon = noone;
	else if(_player.grenadeType == item)
		_player.grenadeType = noone;
	else if(_player.buff[0] == item)
		RemoveBuff(_player, 0);
	else if(_player.buff[1] == item)
		RemoveBuff(_player, 1);
	else if(_player.healingItem == item)
		_player.healingItem = noone;
	else if(_player.vial == item)
		_player.vial = noone;
	else
		_player.supportItem = noone;
	
	ShopAddStock(item);
	ShopBuildSellList(_shop);
	
	if(ds_list_size(_shop.itemList[ShopTab.Sell]) == 0)
	{
		_shop.tabSelect = ShopTab.Primary;
		_shop.listSelect = 0;
	}
}

///@function ShopGetStock(itemIndex)

function ShopGetStock(_itemIndex)
{
	return global.shopID.stock[_itemIndex];
}

///@function ShopRemoveStock(itemIndex)

function ShopRemoveStock(_itemIndex)
{
	global.shopID.stock[_itemIndex] -= 1;
}

///@function ShopAddStock(itemIndex)

function ShopAddStock(_itemIndex)
{
	if(global.shopID.stock[_itemIndex] < global.shopID.stockMax[_itemIndex])
		global.shopID.stock[_itemIndex] += 1;
}

///@function ShopGetSellPrice(itemIndex)

function ShopGetSellPrice(_itemIndex)
{
	if(_itemIndex == noone)
		return 0;
	return DataBaseShopGetInfo(_itemIndex, ShopKey.Price) / 2;
}

///@function ShopCanAffordAndBuy(player, itemIndex, sellPrice)

function ShopCanAffordAndBuy(_player, _itemIndex, _sellPrice)
{
	var _price = DataBaseShopGetInfo(_itemIndex, ShopKey.Price) - _sellPrice;
	if(PlayerGetMoney(_player) >= _price)
	{
		PlayerSpendMoney(_player, _price);
		ShopRemoveStock(_itemIndex);
		return true;
	}
	return false;
}

///@function ShopSetDescription(shop)

function ShopSetDescription(_shop)
{
	var item = ShopGetItemID(_shop);
	_shop.itemIconIndex = item;
	_shop.itemName = DataBaseShopGetInfo(item, ShopKey.Name);
	_shop.itemDescription = DataBaseShopGetInfo(item, ShopKey.Description);
	_shop.itemPrice = DataBaseShopGetInfo(item, ShopKey.Price);
	_shop.sellPrice = ShopGetSellPrice(ShopGetPlayerItem(_shop));
	if(item == SpecialType.Revive)
		_shop.itemPrice += global.shopID.revivePriceAdd;
}

///@function ShopGetPlayerItem(shop)

function ShopGetPlayerItem(_shop)
{
	switch(_shop.tabSelect)
	{
		case ShopTab.Primary:
			return _shop.player.weapon[0];
		case ShopTab.Secondary:
			return _shop.player.weapon[1];
		case ShopTab.Melee:
			return _shop.player.meleeWeapon;
		case ShopTab.Grenades:
			return _shop.player.grenadeType;
		case ShopTab.Medical:
			return _shop.player.healingItem;
		case ShopTab.Vials:
			return _shop.player.vial;
		case ShopTab.Support:
			return _shop.player.supportItem;
		default:
			return noone;
	}
	return noone;
}

///@function ShopGetItemID(shop)

function ShopGetItemID(_shop)
{
	return _shop.itemList[_shop.tabSelect][| _shop.listSelect];
}

///@function ShopBuildSellList(shop)

function ShopBuildSellList(_shop)
{
	ds_list_clear(_shop.itemList[ShopTab.Sell]);
	
	//primary
	var item = _shop.player.weapon[0];
	if(item != noone)
		ds_list_add(_shop.itemList[ShopTab.Sell], item);
	//secondary
	item = _shop.player.weapon[1];
	if(item != noone)
		ds_list_add(_shop.itemList[ShopTab.Sell], item);
	//melee
	item = _shop.player.meleeWeapon;
	if(item != noone)
		ds_list_add(_shop.itemList[ShopTab.Sell], item);
	//grenades
	item = _shop.player.grenadeType;
	if(item != noone)
		ds_list_add(_shop.itemList[ShopTab.Sell], item);
	//buffs
	item = _shop.player.buff[0];
	if(item != noone and _shop.player.buffCooldown[0] == 0)
		ds_list_add(_shop.itemList[ShopTab.Sell], item);
	
	item = _shop.player.buff[1];
	if(item != noone and _shop.player.buffCooldown[1] == 0)
		ds_list_add(_shop.itemList[ShopTab.Sell], item);
	//medical
	item = _shop.player.healingItem;
	if(item != noone)
		ds_list_add(_shop.itemList[ShopTab.Sell], item);
	//vial
	item = _shop.player.vial;
	if(item != noone)
		ds_list_add(_shop.itemList[ShopTab.Sell], item);
	//support
	item = _shop.player.supportItem;
	if(item != noone)
		ds_list_add(_shop.itemList[ShopTab.Sell], item);
	
	if(_shop.tabSelect == ShopTab.Sell)
	{
		if(_shop.listSelect > ds_list_size(_shop.itemList[ShopTab.Sell]) - 1)
			_shop.listSelect = ds_list_size(_shop.itemList[ShopTab.Sell]) - 1;
	}
}

///@function ShopUpdateSpecials()

function ShopUpdateSpecials()
{
	with(ShopUI)
	{
		ShopBuildSpecialList(id);
		ShopSetDescription(id);
	}
}

///@function ShopBuildSpecialList(shop)

function ShopBuildSpecialList(_shop)
{
	var _list = _shop.itemList[ShopTab.Special];
	ds_list_clear(_list);
	ds_list_clear(global.shopID.reviveList);
	
	for(var i=0; i<global.playerAmount; i++)
	{
		var _player = instance_find(Player, i);
		if(_player.isDead)
		{
			ds_list_add(_list, SpecialType.Revive);
			ds_list_add(global.shopID.reviveList, _player);
		}
	}
	
	if(!global.shopID.hasBank and global.shopID.unlockBankOption)
		ds_list_add(_list, SpecialType.Bank);
		
	if(!global.shopID.hasCallExtract[_shop.player.playerID] and global.shopID.unlockCallExtractOption)
		ds_list_add(_list, SpecialType.CallExtract);
	
	if(_shop.tabSelect == ShopTab.Special)
	{
		if(ds_list_size(_list) == 0)
		{
			_shop.tabSelect -= 1;
			_shop.listSelect = 0;
		}
	
		if(_shop.listSelect > ds_list_size(_shop.itemList[_shop.tabSelect]) - 1)
			_shop.listSelect = ds_list_size(_shop.itemList[_shop.tabSelect]) - 1;
	}
}

///@function ShopMajorThreatDefeated()

function ShopMajorThreatDefeated()
{
	if(global.shopID.unlockCallExtractOption)
		return;
		
	global.shopID.unlockCallExtractOption = true;
	MessageAddAll("Call Extract is availible in the shop", MessageFilter.Notification);
}
