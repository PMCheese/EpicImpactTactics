/// @description Update from collection
// You can write your code in this editor

var _saveData = array_create(0);


	
with(characters){
	
	var _saveEntity = 
	{

		obj : object_get_name(object_index),
		num_owned : num_owned,
		rarity : rarity,
		char_health : char_health,
		attack_damage : attack_damage,
		attack_range : attack_range, 
		defence : defence,
		base_health : base_health,
		base_attack : base_attack,
		base_def : base_def,
		added_health : added_health,
		added_def : added_def,
		added_attack : added_attack
		
	}
	array_push(_saveData, _saveEntity);
	
}
	


own_team = _saveData

var _string = json_stringify(_saveData);
var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);

show_debug_message("Collection Units: " + _string)



buffer_seek(client_buffer, buffer_seek_start, 0);
buffer_write(client_buffer, buffer_u8, network.update_json);
buffer_write(client, buffer_string, _string);
network_send_packet(client, client_buffer, buffer_tell(client_buffer));