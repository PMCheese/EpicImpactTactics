

rowLength = 12;

for(var i = 0; i < INVENTORY_SLOTS; i++){
	
	var xx = x + (i mod rowLength) * 72 + 2;
	var yy = y + (i div rowLength) * 72 + 2;

	//draw_sprite(spr_slot, 0, xx, yy)
	
	if(con_client.collection[i] != -1){
		
		with(instance_create_layer(xx, yy, layer, asset_get_index(con_client.collection[i].obj))){
					
			num_owned = num_owned;
			image_speed = 0;
			image_index = 0;
			rarity = rarity;
			base_health = base_health;
			attack_damage = attack_damage;
			attack_range = attack_range;
			is_other_team = false;
			added_health =  con_client.collection[i].added_health;
			added_def = added_def;
			added_attack = added_attack;
			
			char_health = base_health + added_health;
			
		
		}
		
		//draw_sprite(object_get_sprite(collection[i].obj), 0, xx, yy);
	
	}
	
}



