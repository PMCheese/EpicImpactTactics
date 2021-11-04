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
	
	
	
	if(stacks == 2){
		
		nearest_target.char_health = nearest_target.char_health - (45);	
		stacks = 0;
		
		with(instance_create_layer(x+31, y+31, layer, oSpecialProjectile)){
					
			move_towards_point(other.nearest_target.x, other.nearest_target.y, 15)
			
			target_x = other.nearest_target.x
			target_y = other.nearest_target.y
					
		}
		
		
	}else{
		
		with(instance_create_layer(x+31, y+31, layer, oGenericProjectile)){
					
			move_towards_point(other.nearest_target.x, other.nearest_target.y, 15)
			
			target_x = other.nearest_target.x
			target_y = other.nearest_target.y
					
		}

		nearest_target.char_health = nearest_target.char_health - (attack_damage - nearest_target.defence);
		stacks++;
	}
	
	
	
	
}

alarm[0] = 60;