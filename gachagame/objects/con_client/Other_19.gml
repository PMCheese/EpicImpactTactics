/// @description Gacha update to server

var _saveData = array_create(0);

for(i = 0; i < oPullMessage.temp+1; i++){
	if(collection[i] != -1){array_push(_saveData, collection[i]);}
}

var _string = json_stringify(_saveData);
show_debug_message("String to send to server: " + _string)
buffer_seek(client_buffer, buffer_seek_start, 0);
buffer_write(client_buffer, buffer_u8, network.update_json);
buffer_write(client_buffer, buffer_string, _string);

network_send_packet(client, client_buffer, buffer_tell(client_buffer));
