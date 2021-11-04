/// @description Insert description here
// You can write your code in this editor
if(image_index == 0){
	draw_text_colour(x, y, string(char_health), c_green, c_green, c_green, c_green, 1)	
	draw_text_colour(x, y+16, string(currentMana), c_blue, c_blue, c_blue, c_blue, 1)
}else if(image_index == 1){
	draw_text_colour(x+32, y+32, string(char_health), c_green, c_green, c_green, c_green, 1)
	draw_text_colour(x+32, y+48, string(currentMana), c_blue, c_blue, c_blue, c_blue, 1)
}