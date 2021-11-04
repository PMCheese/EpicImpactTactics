/// @description tell server the winner
// You can write your code in this editor

//team_dead++ when P1 dies

if(team_dead == 5) and (current_player == 2){
	buffer_seek(client_buffer, buffer_seek_start, 0);
	buffer_write(client_buffer, buffer_u8, network.round_winner);
	buffer_write(client_buffer, buffer_u8, 2);
	network_send_packet(client, client_buffer, buffer_tell(client_buffer));
}else if(enemy_dead == 5) and (current_player == 1){
	buffer_seek(client_buffer, buffer_seek_start, 0);
	buffer_write(client_buffer, buffer_u8, network.round_winner);
	buffer_write(client_buffer, buffer_u8, 1);
	network_send_packet(client, client_buffer, buffer_tell(client_buffer));
}

current_player = 0;
team_dead = 0;
enemy_dead = 0;

player1 = "Player 1";
player2 = "Player 2";