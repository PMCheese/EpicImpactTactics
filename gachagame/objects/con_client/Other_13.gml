/// @description unchoose player slot 2

buffer_seek(client_buffer, buffer_seek_start, 0);
buffer_write(client_buffer, buffer_u8, network.player_unchoose);

if(oPlayer2Select.text == "Player 2"){
	buffer_write(client_buffer, buffer_u8, 2);
}

network_send_packet(client, client_buffer, buffer_tell(client_buffer));