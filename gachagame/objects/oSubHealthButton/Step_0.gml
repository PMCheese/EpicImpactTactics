var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left)

hover = lerp(hover, _hover, 0.1);

//check if button has a different name, if it has player1, make it your name, if it has a different name, do nothing
if(_click){
	
	with(caller){
		if((added_health + added_attack + added_def) <= num_owned){
			added_health--
			 event_user(2)
		}
	}

}