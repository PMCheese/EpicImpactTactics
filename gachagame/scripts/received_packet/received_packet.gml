function received_packet(){
	
	buffer = argument0;
	socket = argument1;

	msgid = buffer_read(buffer, buffer_u8);
	
	switch(msgid){
	
		case network.update_lobby:
			slot = buffer_read(buffer, buffer_u8);
			tempplayer = buffer_read(buffer, buffer_text);
			
			if(slot == 1){
				player1 = tempplayer
			}else if(slot == 2){
				player2 = tempplayer
			}
			break;
	
		case network.player_collection:
			
			var received_json = buffer_read(buffer, buffer_string);
			show_debug_message("Received from server: " + received_json)
			
			var _loadData = json_parse(received_json);
			
			var i = 0;

			while(array_length(_loadData) > 0){
				
				var _loadEntity = array_pop(_loadData);
					
				collection[i] = _loadEntity;
					
				i++; 
			
			}
			
			room_goto(next_room)
			
	
			break;
			
			
		case network.prep_start:
			if(oPlayer1Select.text == user){
				room_goto(PrepRoom1)
			}else{
				room_goto(PrepRoom2)	
			}
			
			break;
			
		case network.battle_start:
			event_user(7)
			
			break;
			
		case network.send_units:
			
			var received_json = buffer_read(buffer, buffer_string);
			show_debug_message("Other team: " + received_json)
			
			var _loadData = json_parse(received_json);
			
			var i = 0;

			while(array_length(_loadData) > 0){
				
				var _loadEntity = array_pop(_loadData);
					
				other_team[i] = _loadEntity;
				
				show_debug_message(other_team[i].obj)
					
				i++; 
			
			}
			
			random_set_seed(187234)
		
			room_goto(BattleRoom)
			
			//characters.alarm[0] = 60;
			break;
			
		case network.gacha_check:
			
			premium_currency = buffer_read(buffer, buffer_u8)
			
			break;
		
	
	}
	
	
}




