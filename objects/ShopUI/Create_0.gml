tabSelect = ShopTab.Primary;
maxTab = 8;
	
tab[0] = "Primary";
tab[1] = "Secondary";
tab[2] = "Melee";
tab[3] = "Grenades";
tab[4] = "Buffs";
tab[5] = "Medical";
tab[6] = "Vials";
tab[7] = "Support";
tab[8] = "Sell";

listSelect = 0;

//create lists
for(var i=0; i<ShopTab.count; i++)
{
	itemList[i] = ds_list_create();
}

//populate lists
ds_list_add(itemList[ShopTab.Primary], "Chicken");
ds_list_add(itemList[ShopTab.Primary], "Beef");
ds_list_add(itemList[ShopTab.Primary], "Pork");

ds_list_add(itemList[ShopTab.Secondary], "Fire Cracker");
ds_list_add(itemList[ShopTab.Secondary], "YoYo");
ds_list_add(itemList[ShopTab.Secondary], "Slingshot");

ds_list_add(itemList[ShopTab.Melee], "Prison Shank");