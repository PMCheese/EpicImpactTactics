/// @description Insert description here
// You can write your code in this editor
/*
if(char_health <= 0){
	
	if(!is_other_team){
		con_client.team_dead++;	
	}else{
		con_client.enemy_dead++;
	}
	
	if(team_dead == 5){
		room_goto(P1winRoom)
	}else if(enemy_dead == 5){
		room_goto(P2WinRoom)
	}

	instance_destroy(self)
	
}


nearest_target = instance_furthest(x, y, characters)
var closest = 1000000;
var distance = 0;

with(characters){
	
	if(is_other_team != other.is_other_team){
		distance = point_distance(x, y, other.x, other.y);
		if(distance < closest){
			closest = distance;
			other.nearest_target = id;
		}
	}
	
}


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

alarm[0] = 61;