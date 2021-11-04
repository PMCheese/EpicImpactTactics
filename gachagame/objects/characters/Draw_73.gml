if(image_index == 0){
	draw_text_color(x, y, string(char_health), c_green, c_green, c_green, c_green, 1)	
	draw_text_color(x, y+15, string(currentMana) + "/" + string(mana_to_cast), c_aqua, c_aqua, c_aqua, c_aqua, 1)	
}else{
	draw_text_color(x+31, y+31, string(char_health), c_green, c_green, c_green, c_green, 1)
	draw_text_color(x+31, y+46, string(currentMana) + "/" + string(mana_to_cast), c_aqua, c_aqua, c_aqua, c_aqua, 1)	
}

if(menu_open == 1){
	
	draw_set_colour(c_white);
	draw_rectangle(x + 64, y, x + 320, y + 320, false);
	draw_set_colour(c_black);
	draw_text(x + 80, y + 16, char_name + " " + string(rarity) + "*");
	draw_text(x + 80, y + 48, "Health: " + string(char_health));
	draw_text(x + 80, y + 64, "Attack: " + string(attack_damage));
	draw_text(x + 80, y + 80, "Defence: " + string(defence));
	draw_text(x + 80, y + 96, "Attack Range: " + string(attack_range));
	draw_text(x + 80, y + 112, "Mana to Cast: " + string(mana_to_cast));
	draw_text_ext(x + 80, y + 144, "Ability: " + ability_desc, 16, 230)
	
	
	draw_text(x + 80, y + 32, "Upgrades available: " + string(num_owned));
	draw_text(x + 276, y + 48, added_health);
	draw_text(x + 276, y + 64, added_attack);
	draw_text(x + 276, y + 80, added_def);
	
}

