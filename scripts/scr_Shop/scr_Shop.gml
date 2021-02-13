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
	var price = ShopGetItemData(item, ShopKey.Price);
	var sellPrice = 0;
	
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
			if(item == SupportType.Armour)
			{
				if(ShopCanAffordAndBuy(_shop.player, item, 0))
				{
					_shop.player.armour = _shop.player.maxArmour;
				}
			}
			else
			{
				sellPrice = ShopGetSellPrice(_shop.player.supportItem);
				if(ShopCanAffordAndBuy(_shop.player, item, sellPrice))
				{
					_shop.player.supportItem = item;
				}
			}
			break;
		case ShopTab.Special:
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
	
	ShopBuildSellList(_shop);
	
	if(ds_list_size(_shop.itemList[ShopTab.Sell]) == 0)
		_shop.tabSelect = ShopTab.Primary;
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
	
	if(PlayerGetMoney(_player) >= ShopGetItemData(_itemIndex, ShopKey.Price) - _sellPrice)
	{
		PlayerSpendMoney(_player, ShopGetItemData(_itemIndex, ShopKey.Price) - _sellPrice);
		return true;
	}
	return false;
}

///@function ShopSetDescription(shop)

function ShopSetDescription(_shop)
{
	var item = ShopGetItemID(_shop);
	_shop.itemName = ShopGetItemData(item, ShopKey.Name);
	_shop.itemDescription = ShopGetItemData(item, ShopKey.Description);
	_shop.itemPrice = ShopGetItemData(item, ShopKey.Price);
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
	
	if(_shop.listSelect > ds_list_size(_shop.itemList[ShopTab.Sell]) - 1)
		_shop.listSelect = ds_list_size(_shop.itemList[ShopTab.Sell]) - 1;
}