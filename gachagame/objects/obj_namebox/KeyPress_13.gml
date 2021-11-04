con_client.user = message; 

if(ds_list_find_index(con_client.login_list, message) >= 0){
	
	with(instance_find(con_client, 0)){
		event_user(0)
		event_user(4)
		event_user(6)
		next_room = menuRoom
	}

	
}



