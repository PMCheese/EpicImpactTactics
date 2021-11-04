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
	
	nearest_target.char_health = nearest_target.char_health - (attack_damage - nearest_target.defence);	
	
}

alarm[0] = 60;