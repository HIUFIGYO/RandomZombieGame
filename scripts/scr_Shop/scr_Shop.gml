enum ShopTab
{
	Primary,
	Secondary,
	Melee,
	Grenades,
	Buffs,
	Medical,
	Vials,
	Support,
	Special,
	Sell,
	count
}

enum ShopKey
{
	Name,
	Description,
	Price
}

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
	var sellPrice = 0;
	
	if(_shop.tabSelect < ShopTab.Special and ShopGetStock(item) <= 0)
		return;
	
	switch(_shop.tabSelect)
	{
		case ShopTab.Primary:
			sellPrice = ShopGetSellPrice(_shop.player.weapon[0]);
			if(ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				GiveWeapon(_shop.player, item, 0);
			}
			break;
		case ShopTab.Secondary:
			sellPrice = ShopGetSellPrice(_shop.player.weapon[1]);
			if(ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				GiveWeapon(_shop.player, item, 1);
			}
			break;
		case ShopTab.Melee:
			sellPrice = ShopGetSellPrice(_shop.player.meleeWeapon);
			if(ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				GiveMelee(_shop.player, item);
			}
			break;
		case ShopTab.Grenades:
			sellPrice = ShopGetSellPrice(_shop.player.grenadeType);
			if(ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				GiveExplosive(_shop.player, item);
			}
			break;
		case ShopTab.Buffs:
			if(_shop.player.buff[0] == noone and _shop.player.buff[1] != item)
			{
				if(ShopCanAffordAndBuy(_shop.player, item, sellPrice))
				{
					GiveBuff(_shop.player, item, 0);
				}
			}
			else if(_shop.player.buff[1] == noone and _shop.player.buff[0] != item)
			{
				if(ShopCanAffordAndBuy(_shop.player, item, sellPrice))
				{
					GiveBuff(_shop.player, item, 1);
				}
			}
			break;
		case ShopTab.Medical:
			sellPrice = ShopGetSellPrice(_shop.player.healingItem);
			if(ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
				GiveMedical(_shop.player, item);
			}
			break;
		case ShopTab.Vials:
			sellPrice = ShopGetSellPrice(_shop.player.vial);
			if(ShopCanAffordAndBuy(_shop.player, item, sellPrice))
			{
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
				if(ShopCanAffordAndBuy(_shop.player, item, sellPrice))
				{
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
					RevivePlayer(_player, GetMaxHealth(_player));
					global.shopID.revivePriceAdd += global.shopID.reviveAddAmount;
					ShopBuildSpecialList(_shop);
				}
			}
			else if(item == SpecialType.Bank)
			{
				if(ShopCanAffordAndBuy(_shop.player, item, 0))
				{
					global.shopID.hasBank = true;
					ShopBuildSpecialList(_shop);
				}
			}
			break;
	}
	
	ShopBuildSellList(_shop);
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
		_player.buff[0] = noone;
	else if(_player.buff[1] == item)
		_player.buff[1] = noone;
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

///@function ShopGetItemData(itemIndex, shopKey)

function ShopGetItemData(_itemIndex, _shopKey)
{
	return DataBase.shop[_itemIndex, _shopKey];
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
	return ShopGetItemData(_itemIndex, ShopKey.Price) / 2;
}

///@function ShopCanAffordAndBuy(player, itemIndex, sellPrice)

function ShopCanAffordAndBuy(_player, _itemIndex, _sellPrice)
{
	var _price = ShopGetItemData(_itemIndex, ShopKey.Price) - _sellPrice;
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
	show_debug_message(item);
	_shop.itemName = ShopGetItemData(item, ShopKey.Name);
	_shop.itemDescription = ShopGetItemData(item, ShopKey.Description);
	_shop.itemPrice = ShopGetItemData(item, ShopKey.Price);
	_shop.sellPrice = ShopGetSellPrice(ShopGetPlayerItem(_shop));
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
