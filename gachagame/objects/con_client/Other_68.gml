type_event = ds_map_find_value(async_load, "type");

switch(type_event){

	case network_type_data:
		buffer = ds_map_find_value(async_load, "buffer");
		buffer_seek(buffer, buffer_seek_start, 0);
		received_packet(buffer);
		break;
	
	case network_type_connect:
		socket = ds_map_find_value(async_load, "socket")
		ds_list_add(socket_list, socket);
		
		break;
}