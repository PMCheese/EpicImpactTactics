/// @description Update stats
// You can write your code in this editor

switch(rarity){
	
	case 3:
		health_multiplier = 1
		break;
		
	case 4:
		health_multiplier = 10
		break;
		
	case 5:
		health_multiplier = 100
		break;
	
}

char_health = base_health + (added_health*health_multiplier)
attack_damage = base_attack + (added_attack*attack_multiplier)
defence = base_def + (added_def*def_multiplier)