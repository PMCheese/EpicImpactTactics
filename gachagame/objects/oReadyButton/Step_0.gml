var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left)

hover = lerp(hover, _hover, 0.1);



//check if button has a different name, if it has player1, make it your name, if it has a different name, do nothing
if(_click){
	
	if(text = "Not Ready"){
		text = "Ready"	
		var _ready = true;
	}else if(text = "Ready"){
		text = "Not Ready"
		var _ready = false;
		con_client.current_player = 0;
	}
	
	if(oPlayer1Select.text == con_client.user){
		var _player = 1;
		con_client.current_player = 1
	}else if(oPlayer2Select.text == con_client.user){
		var _player = 2;	
		con_client.current_player = 2
	}

	with(instance_find(con_client, 0)){
		buffer_seek(client_buffer, buffer_seek_start, 0);
		buffer_write(client_buffer, buffer_u8, network.ready_check);
		buffer_write(client_buffer, buffer_u8, _player);
		buffer_write(client_buffer, buffer_bool, _ready);
		network_send_packet(client, client_buffer, buffer_tell(client_buffer));
	}

}


if((con_client.user == oPlayer1Select.text) or (con_client.user == oPlayer2Select.text)){
	self.visible = true;
}else{
	self.visible = false;
}



