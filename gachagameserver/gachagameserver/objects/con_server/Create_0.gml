enum network{
	
	player_connect,
	player_choose,
	player_unchoose,
	update_lobby,
	player_collection,
	ready_check,
	prep_start,
	ready_for_battle,
	battle_start,
	send_units,
	gacha_check,
	gacha_pull,
	update_json,
	round_winner
	
}


port = 50000;
max_client = 10;

network_create_server(network_socket_tcp, port, max_client);

server_buffer = buffer_create(5000, buffer_fixed, 1);
socket_list = ds_list_create();
stocket_to_instanceid = ds_map_create();

user_list = ds_list_create();

player1 = "Player 1";
player2 = "Player 2";
player1sock = 0;
player2sock = 0;
player1_ready = false;
player2_ready = false;

ready_players = 0;

