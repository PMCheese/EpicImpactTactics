/// @description unchoose player slot 1
// You can write your code in this editor


buffer_seek(client_buffer, buffer_seek_start, 0);
buffer_write(client_buffer, buffer_u8, network.player_unchoose);

if(oPlayer1Select.text == "Player 1"){
	buffer_write(client_buffer, buffer_u8, 1);	
}

network_send_packet(client, client_buffer, buffer_tell(client_buffer));