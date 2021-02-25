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

itemIconIndex = noone;
itemName = "";
itemDescription = "";
itemPrice = 0;
sellPrice = 0;

//create lists
for(var i=0; i<ShopTab.count; i++)
{
	itemList[i] = ds_list_create();
}

//populate lists
ds_list_add(itemList[ShopTab.Primary], Weapon.Rifle);
ds_list_add(itemList[ShopTab.Primary], Weapon.Shotgun);
ds_list_add(itemList[ShopTab.Primary], Weapon.Rifle2);
ds_list_add(itemList[ShopTab.Primary], Weapon.Shotgun2);
ds_list_add(itemList[ShopTab.Primary], Weapon.Rifle3);
ds_list_add(itemList[ShopTab.Primary], Weapon.Shotgun3);
ds_list_add(itemList[ShopTab.Primary], Weapon.Flame);
ds_list_add(itemList[ShopTab.Primary], Weapon.Rocket);
ds_list_add(itemList[ShopTab.Primary], Weapon.Tesla);
ds_list_add(itemList[ShopTab.Primary], Weapon.Acid);
ds_list_add(itemList[ShopTab.Primary], Weapon.Drainer);
ds_list_add(itemList[ShopTab.Primary], Weapon.BHDarker);

ds_list_add(itemList[ShopTab.Secondary], Weapon.Pistol);
ds_list_add(itemList[ShopTab.Secondary], Weapon.Pistol2);
ds_list_add(itemList[ShopTab.Secondary], Weapon.Pistol3);
ds_list_add(itemList[ShopTab.Secondary], Weapon.Purple);

ds_list_add(itemList[ShopTab.Melee], Weapon.Knife);
ds_list_add(itemList[ShopTab.Melee], Weapon.Knife2);
ds_list_add(itemList[ShopTab.Melee], Weapon.Knife3);
ds_list_add(itemList[ShopTab.Melee], Weapon.Knife4);

ds_list_add(itemList[ShopTab.Grenades], ExplosiveType.Grenade);
ds_list_add(itemList[ShopTab.Grenades], ExplosiveType.Incendiary);
ds_list_add(itemList[ShopTab.Grenades], ExplosiveType.Mine);
ds_list_add(itemList[ShopTab.Grenades], ExplosiveType.BHBomber);

ds_list_add(itemList[ShopTab.Buffs], Buff.Regeneration);
ds_list_add(itemList[ShopTab.Buffs], Buff.Health);
ds_list_add(itemList[ShopTab.Buffs], Buff.Resistance);
ds_list_add(itemList[ShopTab.Buffs], Buff.Stamina);
ds_list_add(itemList[ShopTab.Buffs], Buff.Agility);
ds_list_add(itemList[ShopTab.Buffs], Buff.Reload);
ds_list_add(itemList[ShopTab.Buffs], Buff.Ammo);
ds_list_add(itemList[ShopTab.Buffs], Buff.Damage);
ds_list_add(itemList[ShopTab.Buffs], Buff.Critical);
ds_list_add(itemList[ShopTab.Buffs], Buff.Scout);
ds_list_add(itemList[ShopTab.Buffs], Buff.Medic);
ds_list_add(itemList[ShopTab.Buffs], Buff.Demo);

ds_list_add(itemList[ShopTab.Medical], HealingType.Medicine);
ds_list_add(itemList[ShopTab.Medical], HealingType.Syringe);
ds_list_add(itemList[ShopTab.Medical], HealingType.MedKit);

ds_list_add(itemList[ShopTab.Vials], VialType.Adrenaline);
ds_list_add(itemList[ShopTab.Vials], VialType.Strength);
ds_list_add(itemList[ShopTab.Vials], VialType.Mimicry);
ds_list_add(itemList[ShopTab.Vials], VialType.Survivalist);
ds_list_add(itemList[ShopTab.Vials], VialType.Rapid);
ds_list_add(itemList[ShopTab.Vials], VialType.TradeOff);

ds_list_add(itemList[ShopTab.Support], SupportType.Armour);
ds_list_add(itemList[ShopTab.Support], SupportType.Barricade);
ds_list_add(itemList[ShopTab.Support], SupportType.AdvBarricade);
ds_list_add(itemList[ShopTab.Support], SupportType.Turret);
ds_list_add(itemList[ShopTab.Support], SupportType.HealGenerator);
ds_list_add(itemList[ShopTab.Support], SupportType.AmmoCrate);
ds_list_add(itemList[ShopTab.Support], SupportType.HeavyCrate);
ds_list_add(itemList[ShopTab.Support], SupportType.MythicCrate);
