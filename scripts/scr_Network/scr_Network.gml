///@function NetworkConnect()

function NetworkConnect()
{
	ds_list_add(clientList, async_load[? "socket"]);
}

///@function NetworkDisconnect()

function NetworkDisconnect()
{
	ds_list_delete(clientList, ds_list_find_index(clientList, async_load[? "socket"]));
}

///@function NetworkData()

function NetworkData()
{
	var buffer = async_load[? "buffer"];
	
	buffer_seek(buffer, buffer_seek_start, 0);
	var code = buffer_read(buffer, buffer_s8);
	
	networkProcessData[? code](buffer);
}

enum Network
{
	SendMessage,
	PlayerMoved,
	PlayerJumped
}