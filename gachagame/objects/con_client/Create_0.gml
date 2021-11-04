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

three_star_list = [oEliya3, oAlex3, oJenny3, oMo3, oCallum3, oMichael3, oAiley3];

four_star_list = [oEliya4, oAlex4, oMichael4];

five_star_list = [oEliya5, oAlex5, oJon5, oMo5];

client = network_create_socket(network_socket_tcp);
connected = network_connect(client, "99.240.208.137", 50000);

client_buffer = buffer_create(5000, buffer_fixed, 1);

user = " "; 
player1 = "Player 1";
player2 = "Player 2";
current_player = 0;

battle_characters = ds_list_create();
battle_characters_final = ds_list_create();

collection = array_create(INVENTORY_SLOTS, -1);
other_team = array_create(INVENTORY_SLOTS, -1);
own_team = array_create(INVENTORY_SLOTS, -1);
premium_currency = 0;

team_dead = 0;
enemy_dead = 0;

next_room = ""

login_list = ds_list_create();
ds_list_add(login_list, "test1")
ds_list_add(login_list, "test2")
ds_list_add(login_list, "alex")
ds_list_add(login_list, "eliya")
ds_list_add(login_list, "jenny")
ds_list_add(login_list, "mo")
ds_list_add(login_list, "michael")
ds_list_add(login_list, "jon")
ds_list_add(login_list, "callum")
ds_list_add(login_list, "ailey")
ds_list_add(login_list, "bryce")
