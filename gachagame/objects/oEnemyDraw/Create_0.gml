/// @description draw other users units

game_set_speed(60, gamespeed_fps)

var player1_team = array_create(5, -1);
var player2_team = array_create(5, -1);

if(con_client.current_player == 1){
	player1_team = con_client.own_team;
	player2_team = con_client.other_team;
}else if(con_client.current_player == 2){
	player1_team = con_client.other_team;
	player2_team = con_client.own_team;
}

for(var i = 0; i < array_length(player1_team); i++){
	
	if(player1_team[i] != -1){
		
		with(instance_create_layer(player1_team[i].x, player1_team[i].y, layer, asset_get_index(player1_team[i].obj))){
					
			x = x;
			y = y;
			num_owned = num_owned;
			is_other_team = true;
			image_speed = 0;
			added_health = player1_team[i].added_health;
			added_def = player1_team[i].added_def;
			added_attack = player1_team[i].added_attack;
			attack_range = player1_team[i].attack_range;
			base_health = player1_team[i].base_health;
			char_health = player1_team[i].base_health + (player1_team[i].added_health*health_multiplier)
			attack_damage = player1_team[i].base_attack + (player1_team[i].added_attack*attack_multiplier);
			defence = player1_team[i].base_def + (player1_team[i].added_def*def_multiplier)
			
			
			image_index = 0;
			
		}

	}
	
}

for(var i = 0; i < array_length(player2_team); i++){
	
	if(player2_team[i] != -1){
		
		with(instance_create_layer(player2_team[i].x, player2_team[i].y, layer, asset_get_index(player2_team[i].obj))){
					
			x = x;
			y = y;
			num_owned = num_owned;
			is_other_team = false;
			image_speed = 0;
			rarity = rarity;
			added_health = player2_team[i].added_health;
			added_def = player2_team[i].added_def;
			added_attack = player2_team[i].added_attack;
			attack_range = player2_team[i].attack_range;
			base_health = player2_team[i].base_health;
			char_health = player2_team[i].base_health + (player2_team[i].added_health*health_multiplier)
			attack_damage = player2_team[i].base_attack + (player2_team[i].added_attack*attack_multiplier);
			defence = player2_team[i].base_def + (player2_team[i].added_def*def_multiplier)
			image_index = 1;
			
		}

	}
	
}

alarm[0] = 300
