/// @description Finalalize battle characters

if(con_client.current_player == 1){
	num_ready = collision_rectangle_list(67, 67, 700, 700, characters, false, true, con_client.battle_characters_final, false);
}else if(con_client.current_player == 2){
	num_ready = collision_rectangle_list(705, 65, 1340, 700, characters, false, true, con_client.battle_characters_final, false);
}