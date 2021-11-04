type_event = ds_map_find_value(async_load, "type")

switch(type_event){
	
	case network_type_connect:
		socket = ds_map_find_value(async_load, "socket")
		ds_list_add(socket_list, socket);
		
		//when someone conenct to the lobby, they need to know who's in the lobby already
		for(i = 0; i < ds_list_size(socket_list); i++){
			
			var _sock = ds_list_find_value(socket_list, i);
			
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.update_lobby);
			buffer_write(server_buffer, buffer_u8, 1);
			buffer_write(server_buffer, buffer_text, player1);
			network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
			
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.update_lobby);
			buffer_write(server_buffer, buffer_u8, 2);
			buffer_write(server_buffer, buffer_text, player2);
			network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
			
		}
		
		
		break; 

	case network_type_disconnect:
		socket = ds_map_find_value(async_load, "socket");
		if(player1 == ds_list_find_value(user_list, ds_list_find_index(socket_list, socket))){
			player1 = "Player 1";
			player1sock = 0;
		}else if(player2 == ds_list_find_value(user_list, ds_list_find_index(socket_list, socket))){
			player2 = "Player 2";
			player2sock = 0;
		}
		ds_list_delete(user_list, ds_list_find_index(socket_list, socket));
		ds_list_delete(socket_list, ds_list_find_index(socket_list, socket));
		
		break;
		
	case network_type_data:
		buffer = ds_map_find_value(async_load, "buffer");
		socket = ds_map_find_value(async_load, "id");
		buffer_seek(buffer, buffer_seek_start, 0);
		received_packet(buffer, socket);
		break;
	
	
}