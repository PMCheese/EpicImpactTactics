var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left)

hover = lerp(hover, _hover, 0.1);

if(_click){
	
	if(room == collectionRoom){
		with(instance_find(con_client, 0)){
			event_user(12)	
		}	
	}
	
	room_goto(menuRoom)

}