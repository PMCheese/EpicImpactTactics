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
	
	
	// why do I write shit like this
	// "gwen mode" to emulate gwen E
	// attack range/attack speed/attack damage increase
	if(currentMana == mana_to_cast){
		
		gwen_mode = true;
		attack_range = 2;
		attack_damage = 15;
		alarm[0] = 30;
		
		currentMana = 0
		
	}else{
		attack_range = 1;
		attack_damage = 10;
		
		nearest_target.char_health = nearest_target.char_health - (attack_damage - nearest_target.defence);	
		
		if(!gwen_mode){
			currentMana = currentMana + 10;
			
		}else{
			if(gwen_timer == 10){
				gwen_mode = false;
				gwem_timer = 0;
			}
			gwen_timer++;	
			
		}
		
		
	}
}
if(!gwen_mode){
	alarm[0] = 60;
}else{
	alarm[0] = 30	
}
