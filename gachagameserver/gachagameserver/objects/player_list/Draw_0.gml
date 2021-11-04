draw_text_colour(x, y-50, "User List: ", c_white, c_white, c_white, c_white, 1);

for( i = 0; i < ds_list_size(con_server.user_list); i++){
	
	draw_text_colour(x, y+(i*50), string(con_server.user_list[|i]), c_white, c_white, c_white, c_white, 1)
	
}



	



