/// @description choose player 

buffer_seek(client_buffer, buffer_seek_start, 0);
buffer_write(client_buffer, buffer_u8, network.player_choose);

if(oPlayer1Select.text == user){
	buffer_write(client_buffer, buffer_u8, 1);	
}else if(oPlayer2Select.text == user){
	buffer_write(client_buffer, buffer_u8, 2);
}

buffer_write(client_buffer, buffer_text, user);



network_send_packet(client, client_buffer, buffer_tell(client_buffer));