/// @description create +- buttons
// You can write your code in this editor

  
sub_health_button = instance_create_layer(x+252, y+48, layer, oSubHealthButton)
with(sub_health_button){
	caller = other.id
}

add_health_button = instance_create_layer(x+292, y+48, layer, oAddHealthButton)
with(add_health_button){
	caller = other.id
}

sub_attack_button = instance_create_layer(x+252, y+64, layer, oSubAttackButton)
with(sub_attack_button){
	caller = other.id
}

add_attack_button = instance_create_layer(x+292, y+64, layer, oAddAttackButton)
with(add_attack_button){
	caller = other.id
}

sub_def_button = instance_create_layer(x+252, y+80, layer, oSubDefButton)
with(sub_def_button){
	caller = other.id
}

add_def_button = instance_create_layer(x+292, y+80, layer, oAddDefButton)
with(add_def_button){
	caller = other.id
}