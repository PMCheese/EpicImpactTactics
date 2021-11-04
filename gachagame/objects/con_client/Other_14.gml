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
		
	}
	array_push(_saveData, _saveEntity);
	
}

var _string = json_stringify(_saveData);
var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, string(user)+".json");
buffer_delete(_buffer);