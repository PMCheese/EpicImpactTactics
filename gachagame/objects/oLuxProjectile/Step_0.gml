/// @description Insert description here
// You can write your code in this editor

if(chars_hit == 2){
	instance_destroy(self)
	return;
}

var temp_list = ds_list_create()

					
var num = instance_place_list(x, y, characters, temp_list, false);
					
for(i = 0; i < ds_list_size(temp_list); i++){
	if((is_other_team != temp_list[| i].is_other_team) && (temp_list[| i] != already_hit)){
		temp_list[| i].char_health -= 10;
		with(instance_find(temp_list[| i], 0)){
			alarm[0] = 180;
		}
		already_hit = temp_list[| i];
		chars_hit++;
	}
}