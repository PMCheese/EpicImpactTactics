var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left)

hover = lerp(hover, _hover, 0.1);
text = con_client.player1

//check if button has a different name, if it has player1, make it your name, if it has a different name, do nothing
if(_click){
	
	if(text == "Player 1" && (oPlayer2Select.text != con_client.user)){
		
		text = con_client.user

		with(instance_find(con_client, 0)){
			event_user(1)
		}
		
	}else if(text == con_client.user){
		
		text = "Player 1"
		with(instance_find(con_client, 0)){
			event_user(2)
		}
		
	}

	if((oPlayer1Select.text !=  con_client.user) and (oPlayer2Select.text !=  con_client.user)){
	oReadyButton.text = "Not Ready"	
	with(instance_find(con_client, 0)){
		buffer_seek(client_buffer, buffer_seek_start, 0);
		buffer_write(client_buffer, buffer_u8, network.ready_check);
		buffer_write(client_buffer, buffer_u8, 1);
		buffer_write(client_buffer, buffer_bool, false);
		network_send_packet(client, client_buffer, buffer_tell(client_buffer));
	}
}

}