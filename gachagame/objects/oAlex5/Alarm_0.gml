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
		
		var _checkUnits = ds_list_create();
		
		if(image_index == 0){
			collision_rectangle_list(x, y-63, x+190, y+120, characters, false, true, _checkUnits, false)
		}else{
			collision_rectangle_list(x-190, y-63, x, y+120, characters, false, true, _checkUnits, false)
		}
		
		for(i = 0; i < ds_list_size(_checkUnits); i++){
		
			if(ds_list_find_value(_checkUnits, i).is_other_team != is_other_team){
				ds_list_find_value(_checkUnits, i).char_health -= 100;
			}
			
		}
		
		
		currentMana = 0
		
	}else{
		currentMana = currentMana + 10;
		nearest_target.char_health = nearest_target.char_health - (attack_damage - nearest_target.defence);	
	}
	
	
	
	
}

self.alarm[0] = 60;