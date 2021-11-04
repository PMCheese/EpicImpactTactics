/// @description 3* message

randomise();

var pull = irandom(array_length(con_client.three_star_list)-1)

var obj_pull = con_client.three_star_list[pull]

var new_pull = instance_create_layer(x+64, y+64, layer, obj_pull)

text = "You rolled a 3* " + con_client.three_star_list[pull].char_name

var exists = false;
temp = 0;

for(i = 0; i < array_length(con_client.collection); i++){
	
	if(con_client.collection[i] == -1){
		
		break;
	}else if(con_client.collection[i].obj == object_get_name(obj_pull)){
		
		con_client.collection[@ i].num_owned++;
		
		exists = true; 
		
	}
	
	temp++;
	
}

if(!exists){
	
	with(new_pull){
	
			var _saveEntity = 
			{
		
				obj : object_get_name(object_index),
				num_owned : num_owned,
				rarity : rarity,
				char_health : char_health,
				attack_damage : attack_damage,
				attack_range : attack_range, 
				base_health : base_health,
				added_health : added_health,
				added_def : added_def,
				added_attack : added_attack
				
			}
			
			con_client.collection[@ other.temp] = _saveEntity;
	
		}
		
}

with(instance_find(con_client, 0)){
	event_user(9)	
}



