sort_list = ds_list_create();

with(characters){
	
	ds_list_add(other.sort_list, id)

}

sort_by_distance(sort_list)

for(i = 0; i < ds_list_size(sort_list); i++){
	
	ds_list_find_value(sort_list, i).alarm[0] = i+1
	show_debug_message(string(ds_list_find_value(sort_list, i).id) + " " + string(ds_list_find_value(sort_list, i).alarm[0]))
	
}