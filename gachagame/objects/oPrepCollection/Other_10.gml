/*draw_sprite_stretched(
	
	spr_invbox,
	0,
	x-6,
	y-6,
	12+rowLength*72,
	12+(((INVENTORY_SLOTS-1) div rowLength)+1)*72

);*/
//TODO later, collection backgrounds

for(var i = 0; i < INVENTORY_SLOTS; i++){
	
	var xx = x + (i mod rowLength) * 72 + 2;
	var yy = y + (i div rowLength) *  + 2;
	
	//draw_sprite(spr_slot, 0, xx, yy)
	
	if(con_client.collection[i] != -1){
		
		/*with(instance_create_layer(xx, yy, layer, asset_get_index(con_client.collection[i].obj))){
					
			num_owned = num_owned;
			rarity = rarity;
			char_health = char_health;
			attack_damage = attack_damage;
			attack_range = attack_range;
			
		}*/
		
		instance_create_layer(xx, yy, layer, asset_get_index(con_client.collection[i].obj))
		
		//draw_sprite(object_get_sprite(collection[i].obj), 0, xx, yy);
	
	}
	
}