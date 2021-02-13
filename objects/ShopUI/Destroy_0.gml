for(var i=0; i<ShopTab.count; i++)
{
	ds_list_destroy(itemList[i]);
}
ds_list_destroy(sellList);
ds_map_destroy(itemData);