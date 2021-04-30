///@function NetworkServerInit()

function NetworkServerInit()
{
	serverID = noone;
	port = 67293;
	clientList = ds_list_create();
	
	networkDataType = ds_map_create();

	ds_map_add(networkDataType, network_type_connect, NetworkConnect);
	ds_map_add(networkDataType, network_type_disconnect, NetworkDisconnect);
	ds_map_add(networkDataType, network_type_data, NetworkData);

	networkProcessData = ds_map_create();

	ds_map_add(networkProcessData, Network.SendMessage, NetworkSendMessage);
}

///@function NetworkServerDestroy()

function NetworkServerDestroy()
{
	ds_list_destroy(clientList);
	ds_map_destroy(networkDataType);
	ds_map_destroy(networkProcessData);
}