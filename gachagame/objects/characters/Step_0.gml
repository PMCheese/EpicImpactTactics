if(((room == PrepRoom1) or (room == PrepRoom2))){
	
	if (!drag) {
	   if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
	      drag = true;
	      mx = x - mouse_x;
	      my = y - mouse_y;
	   }
	}
	else {
	   x = mouse_x + mx;
	   y = mouse_y + my;
   
	   x = floor(x/64)*64
	   y = floor(y/64)*64
   
	   check_col = collision_rectangle(x+1, y+1, x+63, y+63, characters, false, true);
	   if(check_col){
		   x = mouse_x - mx;
		   y = mouse_y - my;
	   }
   
	   if (!mouse_check_button(mb_left)) {
	      drag = false;
	   }
	}
	
}

if (position_meeting(mouse_x, mouse_y, id) and (mouse_check_button_pressed(mb_right)) and room == collectionRoom){
	
	if(self.menu_open == 1){
		self.menu_open = 0	
		event_user(1)
		show_debug_message("0")
	}else{
		self.menu_open = 1
		event_user(0)
		show_debug_message("1")
	}
	
}


