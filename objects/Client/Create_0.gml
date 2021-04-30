port = 67293;
socket = network_create_socket(network_socket_tcp);

network_connect(socket, "127.0.0.1", port);