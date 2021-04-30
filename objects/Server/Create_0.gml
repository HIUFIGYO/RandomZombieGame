NetworkServerInit();

serverID = network_create_server(network_socket_tcp, port, 3);

if(serverID < 0)
	show_debug_message("Failed to create server. Error code: 9803489");
else
	show_debug_message("Server created successfully!");
