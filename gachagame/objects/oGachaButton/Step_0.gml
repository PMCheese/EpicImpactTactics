var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left)

hover = lerp(hover, _hover, 0.1);

//check if button has a different name, if it has player1, make it your name, if it has a different name, do nothing
if(_click){
	
	with(instance_find(con_client, 0)){
		event_user(6)
		event_user(8)
		next_room = gachaRoom
	}
	

}