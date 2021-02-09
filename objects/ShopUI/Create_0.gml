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
ds_list_add(itemList[ShopTab.Primary], "Chicken");
ds_list_add(itemList[ShopTab.Primary], "Beef");
ds_list_add(itemList[ShopTab.Primary], "Pork");
ds_list_add(itemList[ShopTab.Primary], "Pork");
ds_list_add(itemList[ShopTab.Primary], "Pork");
ds_list_add(itemList[ShopTab.Primary], "Pork");
ds_list_add(itemList[ShopTab.Primary], "Pork");
ds_list_add(itemList[ShopTab.Primary], "Pork");
ds_list_add(itemList[ShopTab.Primary], "Pork");
ds_list_add(itemList[ShopTab.Primary], "Pork");
ds_list_add(itemList[ShopTab.Primary], "Pork");
ds_list_add(itemList[ShopTab.Primary], "Pork");
ds_list_add(itemList[ShopTab.Primary], "Pork");

ds_list_add(itemList[ShopTab.Secondary], "Fire Cracker");
ds_list_add(itemList[ShopTab.Secondary], "YoYo");
ds_list_add(itemList[ShopTab.Secondary], "Slingshot");

ds_list_add(itemList[ShopTab.Melee], "Prison Shank");