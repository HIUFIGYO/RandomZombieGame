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
	switch(_shop.tabSelect)
	{
		case ShopTab.Primary:
			break;
		case ShopTab.Secondary:
			break;
		case ShopTab.Melee:
			break;
		case ShopTab.Grenades:
			break;
		case ShopTab.Buffs:
			break;
		case ShopTab.Medical:
			break;
		case ShopTab.Vials:
			break;
		case ShopTab.Support:
			ShopBuySupport(_shop);
			break;
		case ShopTab.Special:
			break;
	}
	
	ShopBuildSellList(_shop);
}

///@function ShopSellItem(shop)

function ShopSellItem(_shop)
{
	var _amount = 0;
	
	switch(sellList[| listSelect])
	{
		case ShopTab.Primary:
			_amount = DataWeapon(_shop.player.weapon[0], WeapStat.Price);
			_shop.player.weapon[0] = noone;
			break;
			
		case ShopTab.Secondary:
			_amount = DataWeapon(_shop.player.weapon[1], WeapStat.Price);
			_shop.player.weapon[1] = noone;
			break;
			
		case ShopTab.Melee:
			_amount = DataWeapon(_shop.player.meleeWeapon, WeapStat.Price);
			_shop.player.meleeWeapon = noone;
			break;
			
		case ShopTab.Grenades:
			_amount = DataBase.explosionPrice[_shop.player.grenadeType];
			_shop.player.grenadeType = noone;
			_shop.player.grenadeAmount = 0;
			break;
			
		case ShopTab.Buffs:
			var index = noone;
			if(_shop.player.buff[0] != noone and DataBase.buffName[_shop.player.buff[0]] == _shop.itemList[ShopTab.Sell][| listSelect])
				index = 0;
			else if(_shop.player.buff[1] != noone and DataBase.buffName[_shop.player.buff[1]] == _shop.itemList[ShopTab.Sell][| listSelect])
				index = 1;
				
			if(index != noone)
			{
				_amount = DataBase.buffPrice[_shop.player.buff[index]];
				_shop.player.buff[index] = noone;
			}
			break;
			
		case ShopTab.Medical:
			_amount = DataBase.healingPrice[_shop.player.healingItem];
			_shop.player.healingItem = noone;
			break;
			
		case ShopTab.Vials:
			_amount = DataBase.vialPrice[_shop.player.vial];
			_shop.player.vial = noone;
			break;
			
		case ShopTab.Support:
			_amount = DataBase.supportPrice[_shop.player.supportItem];
			_shop.player.supportItem = noone;
			break;
	}
	
	_amount /= 2;
	
	PlayerGiveMoney(_shop.player, _amount);
	ShopBuildSellList(_shop);
}

///@function ShopGetSelectedPrice(shop)

function ShopGetPrice(_shop)
{
	switch(_shop.tabSelect)
	{
		case ShopTab.Primary:
			return 0;
		case ShopTab.Secondary:
			return 0;
		case ShopTab.Melee:
			return 0;
		case ShopTab.Grenades:
			return 0;
		case ShopTab.Buffs:
			return 0;
		case ShopTab.Medical:
			return 0;
		case ShopTab.Vials:
			return 0;
		case ShopTab.Support:
			return 0;
		case ShopTab.Special:
			return 0;
		case ShopTab.Sell:
			return 0;
	}
	return 0;
}

///@function ShopGetDescription(shop)

function ShopSetDescription(_shop)
{
	_shop.itemName = _shop.itemList[_shop.tabSelect][| _shop.listSelect];
	switch(_shop.tabSelect)
	{
		case ShopTab.Primary:
			_shop.itemDescription = DataWeapon(_shop.player.weapon[0], WeapStat.Description);
			break;
			
		case ShopTab.Secondary:
			_shop.itemDescription = DataWeapon(_shop.player.weapon[1], WeapStat.Description);
			break;
			
		case ShopTab.Melee:
			_shop.itemDescription = DataWeapon(_shop.player.meleeWeapon, WeapStat.Description);
			break;
			
		case ShopTab.Grenades:
			break;
	}
}

///@function ShopBuildSellList(shop)

function ShopBuildSellList(_shop)
{
	ds_list_clear(_shop.itemList[ShopTab.Sell]);
	ds_list_clear(_shop.sellList);
	
	//primary
	var item = _shop.player.weapon[0];
	if(item != noone)
	{
		ds_list_add(_shop.itemList[ShopTab.Sell], DataWeapon(item, WeapStat.Name));
		ds_list_add(_shop.sellList, ShopTab.Primary);
	}
	//secondary
	item = _shop.player.weapon[1];
	if(item != noone)
	{
		ds_list_add(_shop.itemList[ShopTab.Sell], DataWeapon(item, WeapStat.Name));
		ds_list_add(_shop.sellList, ShopTab.Secondary);
	}
	//melee
	item = _shop.player.meleeWeapon;
	if(item != noone)
	{
		ds_list_add(_shop.itemList[ShopTab.Sell], DataWeapon(item, WeapStat.Name));
		ds_list_add(_shop.sellList, ShopTab.Melee);
	}
	//grenades
	item = _shop.player.grenadeType;
	if(item != noone)
	{
		ds_list_add(_shop.itemList[ShopTab.Sell], DataBase.explosionName[item]);
		ds_list_add(_shop.sellList, ShopTab.Grenades);
	}
	//buffs
	item = _shop.player.buff[0];
	if(item != noone and _shop.player.buffCooldown[0] == 0)
	{
		ds_list_add(_shop.itemList[ShopTab.Sell], DataBase.buffName[item]);
		ds_list_add(_shop.sellList, ShopTab.Buffs);
	}
	
	item = _shop.player.buff[1];
	if(item != noone and _shop.player.buffCooldown[1] == 0)
	{
		ds_list_add(_shop.itemList[ShopTab.Sell], DataBase.buffName[item]);
		ds_list_add(_shop.sellList, ShopTab.Buffs);
	}
	//medical
	item = _shop.player.healingItem;
	if(item != noone)
	{
		ds_list_add(_shop.itemList[ShopTab.Sell], DataBase.healingName[item]);
		ds_list_add(_shop.sellList, ShopTab.Medical);
	}
	//vial
	item = _shop.player.vial;
	if(item != noone)
	{
		ds_list_add(_shop.itemList[ShopTab.Sell], DataBase.vialName[item]);
		ds_list_add(_shop.sellList, ShopTab.Vials);
	}
	//support
	item = _shop.player.supportItem;
	if(item != noone)
	{
		ds_list_add(_shop.itemList[ShopTab.Sell], DataBase.supportName[item]);
		ds_list_add(_shop.sellList, ShopTab.Support);
	}
}

///@function ShopBuySupport(shop)

function ShopBuySupport(_shop)
{
	var price;
	switch(_shop.itemList[ShopTab.Support][| _shop.listSelect])
	{
		case "Armour":
			price = DataBase.supportPrice[SupportType.Armour];
			if(_shop.player.money >= price)
			{
				_shop.player.money -= price;
				_shop.player.armour = _shop.player.maxArmour;
			}
			break;
	}	
}