
function received_packet(){
	
	buffer = argument0;
	socket = argument1;
	msgid = buffer_read(buffer, buffer_u8)
	server = instance_find(con_server, 0)
	
	switch(msgid){
		
		case network.player_connect:
			var name = buffer_read(buffer, buffer_text);
			ds_list_add(con_server.user_list, name)
			break;
			
		case network.player_choose:
			slot = buffer_read(buffer, buffer_u8);
			tempplayer = buffer_read(buffer, buffer_text);
			
			if(slot == 1){
				player1 = tempplayer
				player1sock = socket;
			}else if(slot == 2){
				player2 = tempplayer
				player2sock = socket;
			}
			
			for(i = 0; i < ds_list_size(socket_list); i++){
			
				var _sock = ds_list_find_value(socket_list, i);
			
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.update_lobby);
				buffer_write(server_buffer, buffer_u8, 1);
				buffer_write(server_buffer, buffer_text, player1);
				network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
			
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.update_lobby);
				buffer_write(server_buffer, buffer_u8, 2);
				buffer_write(server_buffer, buffer_text, player2);
				network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
			
			}
			
			break;
			
		case network.player_unchoose:
		
			slot = buffer_read(buffer, buffer_u8);
		
			if(slot == 1){
				player1 = "Player 1"
				player1sock = 0
			}else if(slot == 2){
				player2 = "Player 2"
				player2sock = 0;
			}
			
			for(i = 0; i < ds_list_size(socket_list); i++){
			
				var _sock = ds_list_find_value(socket_list, i);
			
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.update_lobby);
				buffer_write(server_buffer, buffer_u8, 1);
				buffer_write(server_buffer, buffer_text, player1);
				network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
			
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.update_lobby);
				buffer_write(server_buffer, buffer_u8, 2);
				buffer_write(server_buffer, buffer_text, player2);
				network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
			
			}
			
			
			
			break;
			
		case network.player_collection:
		//read what user sent the request and load their json file. Then send the json to the client
			var user = buffer_read(buffer, buffer_text);
			var _buffer = buffer_load(string(user) + ".json")
			var _string = buffer_read(_buffer, buffer_string);
			
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.player_collection);
			buffer_write(server_buffer, buffer_string, _string);
			network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
			
			show_debug_message(_string)
			
			break;
			
		case network.ready_check:
			
			player = buffer_read(buffer, buffer_u8)
			ready = buffer_read(buffer, buffer_bool);
			
			if(player = 1){
				player1_ready = ready;
				show_debug_message("Player 1 ready: " + string(player1_ready))
			}else if(player = 2){
				player2_ready = ready;	
				show_debug_message("Player 2 ready: " + string(player2_ready))
			}
			
			if(player1_ready && player2_ready){
				show_debug_message("Game start!");
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.prep_start);
				network_send_packet(player1sock, server_buffer, buffer_tell(server_buffer));
				network_send_packet(player2sock, server_buffer, buffer_tell(server_buffer));
			}
			
			break;
			
		case network.ready_for_battle:
			ready_players++;
			if(ready_players == 2){
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.battle_start);
				network_send_packet(player1sock, server_buffer, buffer_tell(server_buffer));
				network_send_packet(player2sock, server_buffer, buffer_tell(server_buffer));
			}
		
			break;
			
		case network.send_units:
			
			units = buffer_read(buffer, buffer_string);
			
			if(socket == player1sock){
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.send_units);
				buffer_write(server_buffer, buffer_string, units);
				network_send_packet(player2sock, server_buffer, buffer_tell(server_buffer));
			}else if(socket == player2sock){
				buffer_seek(server_buffer, buffer_seek_start, 0);
				buffer_write(server_buffer, buffer_u8, network.send_units);
				buffer_write(server_buffer, buffer_string, units);
				network_send_packet(player1sock, server_buffer, buffer_tell(server_buffer));
			}
		
			break;
			
		case network.gacha_check:
			var user = buffer_read(buffer, buffer_text);
			
			ini_open(string(user) + ".ini");
			
			var num_rolls = ini_read_real("rolls", "num", 0);
			
			show_debug_message(string(num_rolls))
			
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.gacha_check);
			buffer_write(server_buffer, buffer_u8, num_rolls);
			network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
			
			ini_close();
		
			break;
			
		case network.update_json:
		
			var tempuser = con_server.user_list[| ds_list_find_index(socket_list, socket)]
			
			var _string = buffer_read(buffer, buffer_string);
			
			var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
			buffer_write(_buffer, buffer_string, _string);
			buffer_save(_buffer, string(tempuser)+".json");
			buffer_delete(_buffer);
			
			show_debug_message("User to save " + string(tempuser) + " String to save " + _string)
			
			break;
			
		case network.gacha_pull:
		
			var tempuser = buffer_read(buffer, buffer_string);
			
			ini_open(string(tempuser) + ".ini");
			
			var num_rolls = ini_read_real("rolls", "num", 0);
			num_rolls--;
			
			ini_write_real("rolls", "num", num_rolls);
			
			ini_close();
			
			break;
			
		case network.round_winner:
		
			var winner = buffer_read(buffer, buffer_u8);
			
			var winner_user = "";
			var loser_user = "";
			
			if(winner == 1){
				winner_user = player1
				loser_user = player2
			}else if(winner == 2){
				winner_user = player2
				loser_user = player1
			}
			
			show_debug_message("Winner is: " + string(winner_user));
			show_debug_message("Loser is is: " + string(loser_user));
			
			ini_open(string(winner_user) + ".ini");
			
			var num_rolls = ini_read_real("rolls", "num", 0);
			num_rolls += 2;
			
			ini_write_real("rolls", "num", num_rolls);
			
			ini_close();
			
			ini_open(string(loser_user) + ".ini");
			
			var num_rolls = ini_read_real("rolls", "num", 0);
			num_rolls += 1;
			
			ini_write_real("rolls", "num", num_rolls);
			
			ini_close();
			
			player1sock = 0;
			player2sock = 0;
			player1_ready = false;
			player2_ready = false;
			player1 = "Player 1"
			player2 = "Player 2"

			ready_players = 0;
			
			break;
		
	}
		
}

