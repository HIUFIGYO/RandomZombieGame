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
	Price,
	Stock
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

///@function ShopBuildItemData(shop, index)

function ShopBuildItemData(_shop, _index)
{
	ds_map_clear(_shop.itemData);
	
	switch(_shop.tabSelect)
	{
		case ShopTab.Primary:
			ds_map_add(_shop.itemData, ShopKey.Name, DataWeapon(_shop.itemList[ShopTab.Primary][| _index], WeapStat.Name));
			ds_map_add(_shop.itemData, ShopKey.Description, DataWeapon(_shop.itemList[ShopTab.Primary][| _index], WeapStat.Description));
			ds_map_add(_shop.itemData, ShopKey.Price, DataWeapon(_shop.itemList[ShopTab.Primary][| _index], WeapStat.Price));
			ds_map_add(_shop.itemData, ShopKey.Stock, global.shopID.stockWeapon[_index]);
			break;
			
		case ShopTab.Secondary:
			ds_map_add(_shop.itemData, ShopKey.Name, DataWeapon(_shop.itemList[ShopTab.Secondary][| _index], WeapStat.Name));
			ds_map_add(_shop.itemData, ShopKey.Description, DataWeapon(_shop.itemList[ShopTab.Secondary][| _index], WeapStat.Description));
			ds_map_add(_shop.itemData, ShopKey.Price, DataWeapon(_shop.itemList[ShopTab.Secondary][| _index], WeapStat.Price));
			ds_map_add(_shop.itemData, ShopKey.Stock, global.shopID.stockWeapon[_index]);
			break;
			
		case ShopTab.Melee:
			ds_map_add(_shop.itemData, ShopKey.Name, DataWeapon(_shop.itemList[ShopTab.Melee][| _index], WeapStat.Name));
			ds_map_add(_shop.itemData, ShopKey.Description, DataWeapon(_shop.itemList[ShopTab.Melee][| _index], WeapStat.Description));
			ds_map_add(_shop.itemData, ShopKey.Price, DataWeapon(_shop.itemList[ShopTab.Melee][| _index], WeapStat.Price));
			ds_map_add(_shop.itemData, ShopKey.Stock, global.shopID.stockWeapon[_index]);
			break;
			
		case ShopTab.Grenades:
			ds_map_add(_shop.itemData, ShopKey.Name, DataBase.explosionName[_index]);
			ds_map_add(_shop.itemData, ShopKey.Description, DataBase.explosionDescription[_index]);
			ds_map_add(_shop.itemData, ShopKey.Price, DataBase.explosionPrice[_index]);
			ds_map_add(_shop.itemData, ShopKey.Stock, global.shopID.stockExplosion[_index]);
			break;
			
		case ShopTab.Buffs:
			ds_map_add(_shop.itemData, ShopKey.Name, DataBase.buffName[_index]);
			ds_map_add(_shop.itemData, ShopKey.Description, DataBase.buffDescription[_index]);
			ds_map_add(_shop.itemData, ShopKey.Price, DataBase.buffPrice[_index]);
			ds_map_add(_shop.itemData, ShopKey.Stock, global.shopID.stockBuff[_index]);
			break;
			
		case ShopTab.Medical:
			ds_map_add(_shop.itemData, ShopKey.Name, DataBase.healingName[_index]);
			ds_map_add(_shop.itemData, ShopKey.Description, DataBase.healingDescription[_index]);
			ds_map_add(_shop.itemData, ShopKey.Price, DataBase.healingPrice[_index]);
			ds_map_add(_shop.itemData, ShopKey.Stock, global.shopID.stockMedical[_index]);
			break;
			
		case ShopTab.Vials:
			ds_map_add(_shop.itemData, ShopKey.Name, DataBase.vialName[_index]);
			ds_map_add(_shop.itemData, ShopKey.Description, DataBase.vialDescription[_index]);
			ds_map_add(_shop.itemData, ShopKey.Price, DataBase.vialPrice[_index]);
			ds_map_add(_shop.itemData, ShopKey.Stock, global.shopID.stockVial[_index]);
			break;
			
		case ShopTab.Support:
			ds_map_add(_shop.itemData, ShopKey.Name, DataBase.supportName[_index]);
			ds_map_add(_shop.itemData, ShopKey.Description, DataBase.supportDescription[_index]);
			ds_map_add(_shop.itemData, ShopKey.Price, DataBase.supportPrice[_index]);
			ds_map_add(_shop.itemData, ShopKey.Stock, global.shopID.stockSupport[_index]);
			break;
			
		case ShopTab.Special:
			ds_map_add(_shop.itemData, ShopKey.Name, "X");
			ds_map_add(_shop.itemData, ShopKey.Description, "X");
			ds_map_add(_shop.itemData, ShopKey.Price, 0);
			ds_map_add(_shop.itemData, ShopKey.Stock, 1);
			break;
			
		case ShopTab.Sell:
			ds_map_add(_shop.itemData, ShopKey.Name, _shop.itemList[ShopTab.Sell][| _index]);
			ds_map_add(_shop.itemData, ShopKey.Description, "X");
			ds_map_add(_shop.itemData, ShopKey.Price, 0);
			ds_map_add(_shop.itemData, ShopKey.Stock, 1);
			break;
	}
}

///@function ShopGetItemData(shop, key)

function ShopGetItemData(_shop, _key)
{
	return _shop.itemData[? _key];
}

///@function ShopSetDescription(shop)

function ShopSetDescription(_shop)
{
	ShopBuildItemData(_shop, _shop.listSelect);
	_shop.itemName = ShopGetItemData(_shop, ShopKey.Name);
	_shop.itemDescription = ShopGetItemData(_shop, ShopKey.Description);
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
	
	if(_shop.listSelect > ds_list_size(_shop.sellList) - 1)
		_shop.listSelect = ds_list_size(_shop.sellList) - 1;
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