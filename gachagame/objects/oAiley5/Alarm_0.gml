/// @description
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
		
		ability_target = instance_furthest(x, y,characters)
		
		with(instance_create_layer(x+15, y+15, layer, oCircleProjectile)){

			is_other_team = other.is_other_team
					
			move_towards_point(other.ability_target.x, other.ability_target.y, 10)
					
		}
		
		currentMana = 0
		
	}else{
		currentMana = currentMana + 10;
		nearest_target.char_health = nearest_target.char_health - (attack_damage - nearest_target.defence);	
		with(instance_create_layer(x+15, y+15, layer, oGenericProjectile)){
					
			move_towards_point(other.nearest_target.x, other.nearest_target.y, 15)
			
			target_x = other.nearest_target.x
			target_y = other.nearest_target.y
					
		}
	}
	
}

self.alarm[0] = 60;