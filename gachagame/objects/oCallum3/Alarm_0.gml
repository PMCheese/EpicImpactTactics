/// @description Insert description here
// You can write your code in this editor
if(check_win()){
	return; 	
}


nearest_target = instance_furthest(x, y, characters)
var closest = 1000000;
var distance = 0;

search_target()


nearest_x = nearest_target.x
nearest_y = nearest_target.y

//show_debug_message("x: " + string(nearest_x) + "y: " + string(nearest_y))

if((x+attack_range*64) < nearest_x){
	
	x += 64;
	
}else if((y+attack_range*64) < nearest_y){
	
	y += 64;
	
}else if((x-attack_range*64) > nearest_x){
	
	x -= 64;
	
}else if((y-attack_range*64) > nearest_y){
	
	y -= 64;
	
}else{

	if(currentMana == mana_to_cast){
		
		//check directions
		
		var most_targets = 0;
		
		var temp_list = ds_list_create()
		
		var dir = "";
		
		var temp = collision_rectangle_list(x, y-255, x+319, y+63, characters, false, true, temp_list, false)
		
		if(temp > most_targets){
			most_targets = temp;
			dir = "NE"
		}else{
			ds_list_clear(temp_list)	
		}
		
		var temp = collision_rectangle_list(x+1, y+1, x+319, y+319, characters, false, true, temp_list, false)
		
		if(temp > most_targets){
			most_targets = temp;
			dir = "SE"
		}else{
			ds_list_clear(temp_list)	
		}
		
		var temp = collision_rectangle_list(x-255, y+1, x+63, y+319, characters, false, true, temp_list, false)
		
		if(temp > most_targets){
			most_targets = temp;
			dir = "SW"
		}else{
			ds_list_clear(temp_list)	
		}
		
		var temp = collision_rectangle_list(x-255, y-255, x+63, y+63, characters, false, true, temp_list, false)
		
		if(temp > most_targets){
			most_targets = temp;
			dir = "NW"
		}else{
			ds_list_clear(temp_list)	
		}
		
		char_health += 20*temp;
		
		switch(dir){
			
			case "NW":
				with(instance_create_layer(x-122, y+63, layer, oConeHitboxSmall)){
					
					image_angle = 90;
					
					is_other_team = other.is_other_team
					var temp_list2 = ds_list_create()
					
					var num = instance_place_list(x, y, characters, temp_list2, false);
					
					for(i = 0; i < ds_list_size(temp_list2); i++){
						if(is_other_team != temp_list2[| i].is_other_team){
							temp_list2[| i].char_health -= 20;
						}
					}
					
				}
				break;
			
			case "NE":
				with(instance_create_layer(x+1, y-125, layer, oConeHitboxSmall)){
					is_other_team = other.is_other_team
					var temp_list2 = ds_list_create()
					
					var num = instance_place_list(x, y, characters, temp_list2, false);
					
					for(i = 0; i < ds_list_size(temp_list2); i++){
						if(is_other_team != temp_list2[| i].is_other_team){
							temp_list2[| i].char_health -= 20;
						}
					}
				}
				break;
			
			case "SW":
				with(instance_create_layer(x+63, y+186, layer, oConeHitboxSmall)){
					image_angle = 180;
					is_other_team = other.is_other_team
					var temp_list2 = ds_list_create()
					
					var num = instance_place_list(x, y, characters, temp_list2, false);
					
					for(i = 0; i < ds_list_size(temp_list2); i++){
						if(is_other_team != temp_list2[| i].is_other_team){
							temp_list2[| i].char_health -= 20;
						}
					}
				}
				break;
			
			case "SE":
				with(instance_create_layer(x+186, y+1, layer, oConeHitboxSmall)){
					image_angle = 270;
					is_other_team = other.is_other_team
					var temp_list2 = ds_list_create()
					
					var num = instance_place_list(x, y, characters, temp_list2, false);
					
					
					for(i = 0; i < ds_list_size(temp_list2); i++){
						if(is_other_team != temp_list2[| i].is_other_team){
							temp_list2[| i].char_health -= 20;
						}
					}
				}
				break;
			
			default:
				
		}

		currentMana = 0
		
	}else{
		
		
		with(instance_find(oConeHitboxSmall, 0)){
			instance_destroy(self)	
		}
		
		currentMana = currentMana + 10;
		nearest_target.char_health = nearest_target.char_health - (attack_damage - nearest_target.defence);	
		
	}
	
	
	
	
}

self.alarm[0] = 60;