
var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left)

hover = lerp(hover, _hover, 0.1);

var file = " "

//check if button has a different name, if it has player1, make it your name, if it has a different name, do nothing
if(_click){
	file = file_find_first("C:/Users/alexw/AppData/Local/gachagameserver/*.ini", 0);
	
	ini_open(file);
			
	var num_rolls = ini_read_real("rolls", "num", 0);
	num_rolls += 1;
			
	ini_write_real("rolls", "num", num_rolls);
			
	ini_close();
	
	show_debug_message(file + "added a pull");
	
	file = file_find_next()
	
	while(file != ""){
		
		
		ini_open(file);
			
		var num_rolls = ini_read_real("rolls", "num", 0);
		num_rolls += 1;
			
		ini_write_real("rolls", "num", num_rolls);
			
		ini_close();
		
		show_debug_message(file + "added a pull");
		
		file = file_find_next()
		
	}
	
}

