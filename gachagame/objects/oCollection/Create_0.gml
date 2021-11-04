#macro INVENTORY_SLOTS 42

rowLength = 12;

for(var i = 0; i < INVENTORY_SLOTS; i++){
	
	var xx = x + (i mod rowLength) * 72 + 2;
	var yy = y + (i div rowLength) * 72 + 2;

	//draw_sprite(spr_slot, 0, xx, yy)
	
	if(con_client.collection[i] != -1){
		
		with(instance_create_layer(xx, yy, layer, asset_get_index(con_client.collection[i].obj))){
					
			num_owned = con_client.collection[i].num_owned;
			image_speed = 0;
			image_index = 0;
			rarity = rarity;
			base_health = base_health;
			attack_damage = attack_damage;
			attack_range = attack_range;
			is_other_team = false;
			added_health =  con_client.collection[i].added_health;
			added_def = con_client.collection[i].added_def;
			added_attack = con_client.collection[i].added_attack;
			health_multiplier = health_multiplier;
			
			char_health = base_health + (added_health*health_multiplier);
			attack_damage = base_attack + (added_attack*attack_multiplier);
			defence = base_def + (added_def*def_multiplier);
			
		
		}
		
		//draw_sprite(object_get_sprite(collection[i].obj), 0, xx, yy);
	
	}
	
}



