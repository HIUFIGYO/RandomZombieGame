hasControl = false;
alarm[0] = 5;

tabSelect = ShopTab.Primary;
maxTab = ShopTab.count - 1;
	
tab[0] = "Primary";
tab[1] = "Secondary";
tab[2] = "Melee";
tab[3] = "Grenades";
tab[4] = "Buffs";
tab[5] = "Medical";
tab[6] = "Vials";
tab[7] = "Support";
tab[8] = "Special";
tab[9] = "Sell";

listSelect = 0;
listTimer = 0;
listButtonDown = false;

itemName = "";
itemDescription = "";

//create lists
for(var i=0; i<ShopTab.count; i++)
{
	itemList[i] = ds_list_create();
}

sellList = ds_list_create();

//populate lists
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Rifle, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Shotgun, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Rifle2, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Shotgun2, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Rifle3, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Shotgun3, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Flame, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Rocket, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Tesla, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Acid, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.Drainer, WeapStat.Name));
ds_list_add(itemList[ShopTab.Primary], DataWeapon(Weapon.BHDarker, WeapStat.Name));

ds_list_add(itemList[ShopTab.Secondary], DataWeapon(Weapon.Pistol, WeapStat.Name));
ds_list_add(itemList[ShopTab.Secondary], DataWeapon(Weapon.Pistol2, WeapStat.Name));
ds_list_add(itemList[ShopTab.Secondary], DataWeapon(Weapon.Pistol3, WeapStat.Name));
ds_list_add(itemList[ShopTab.Secondary], DataWeapon(Weapon.Purple, WeapStat.Name));

ds_list_add(itemList[ShopTab.Melee], DataWeapon(Weapon.Knife, WeapStat.Name));
ds_list_add(itemList[ShopTab.Melee], DataWeapon(Weapon.Knife2, WeapStat.Name));
ds_list_add(itemList[ShopTab.Melee], DataWeapon(Weapon.Knife3, WeapStat.Name));
ds_list_add(itemList[ShopTab.Melee], DataWeapon(Weapon.Knife4, WeapStat.Name));

ds_list_add(itemList[ShopTab.Grenades], DataBase.explosionName[ExplosiveType.Grenade]);
ds_list_add(itemList[ShopTab.Grenades], DataBase.explosionName[ExplosiveType.Incendiary]);
ds_list_add(itemList[ShopTab.Grenades], DataBase.explosionName[ExplosiveType.Mine]);
ds_list_add(itemList[ShopTab.Grenades], DataBase.explosionName[ExplosiveType.BHBomber]);

ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Regeneration]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Health]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Resistance]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Stamina]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Agility]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Reload]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Ammo]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Damage]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Critical]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Scout]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Medic]);
ds_list_add(itemList[ShopTab.Buffs], DataBase.buffName[Buff.Demo]);

ds_list_add(itemList[ShopTab.Medical], DataBase.healingName[HealingType.Medicine]);
ds_list_add(itemList[ShopTab.Medical], DataBase.healingName[HealingType.Syringe]);
ds_list_add(itemList[ShopTab.Medical], DataBase.healingName[HealingType.MedKit]);

ds_list_add(itemList[ShopTab.Vials], DataBase.vialName[VialType.Adrenaline]);
ds_list_add(itemList[ShopTab.Vials], DataBase.vialName[VialType.Strength]);
ds_list_add(itemList[ShopTab.Vials], DataBase.vialName[VialType.Mimicry]);
ds_list_add(itemList[ShopTab.Vials], DataBase.vialName[VialType.Survivalist]);
ds_list_add(itemList[ShopTab.Vials], DataBase.vialName[VialType.Rapid]);
ds_list_add(itemList[ShopTab.Vials], DataBase.vialName[VialType.TradeOff]);

ds_list_add(itemList[ShopTab.Support], DataBase.supportName[SupportType.Armour]);
ds_list_add(itemList[ShopTab.Support], DataBase.supportName[SupportType.Barricade]);
ds_list_add(itemList[ShopTab.Support], DataBase.supportName[SupportType.AdvBarricade]);
ds_list_add(itemList[ShopTab.Support], DataBase.supportName[SupportType.Turret]);
ds_list_add(itemList[ShopTab.Support], DataBase.supportName[SupportType.HealGenerator]);
ds_list_add(itemList[ShopTab.Support], DataBase.supportName[SupportType.AmmoCrate]);
ds_list_add(itemList[ShopTab.Support], DataBase.supportName[SupportType.HeavyCrate]);
ds_list_add(itemList[ShopTab.Support], DataBase.supportName[SupportType.MythicCrate]);




























