var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left)

hover = lerp(hover, _hover, 0.1);



//check if button has a different name, if it has player1, make it your name, if it has a different name, do nothing
if(_click and visible and locked_in == 0){
	
	text = "Locked in!"
	
	/*
	for(i = 0; i < ds_list_size(con_client.battle_characters); i++){
		con_client.battle_characters[|i].persistent = true;
	}*/
	
	with(instance_find(oPrepCollection, 0)){
		event_user(1);	
	}

	with(instance_find(con_client, 0)){
		buffer_seek(client_buffer, buffer_seek_start, 0);
		buffer_write(client_buffer, buffer_u8, network.ready_for_battle);
		network_send_packet(client, client_buffer, buffer_tell(client_buffer));
	}
	
	locked_in = 1;

}




