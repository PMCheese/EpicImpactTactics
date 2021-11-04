// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sort_by_distance(){

	/// @function sort_by_distance( list, id*);
	/// @param {ds_list} list    List to sort
	/// @param {real} id    Instance / Object to measure to
	/// @description Sort list by distance to provided object

	var list = argument[0];
	var tar = (argument_count > 1 ? argument[1] : id);

	if( ds_list_empty( list)) return;

	var tempList = ds_list_create();

	with( tar){
	    while( ds_list_size( list) > 1){
	        var minI = 0;
	        var minDist = distance_to_object( list[| minI]);
	        for( var i = 1; i < ds_list_size( list); ++i){
	            var dist = distance_to_object( list[| i]);
	            if( dist < minDist){
	                minDist = dist;
	                minI = i;
	            }
	        }
	        ds_list_add( tempList, list[| minI]);
	        ds_list_delete( list, minI);
	    }
	}

	ds_list_add( tempList, list[| 0]);
	ds_list_copy( list, tempList);
	ds_list_destroy( tempList);
}