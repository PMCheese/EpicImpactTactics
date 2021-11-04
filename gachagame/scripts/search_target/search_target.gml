// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function search_target(){
	
	var closest = 1000000;
	var distance = 0;

	
	with(characters){
	
		if(is_other_team != other.is_other_team){
			distance = point_distance(x, y, other.x, other.y);
			if(distance < closest){
				closest = distance;
				other.nearest_target = id;
			}else if(distance == closest){
				if(other.nearest_target.x + other.nearest_target.y) > (x + y){
					other.nearest_target = id;
				}
			}
		}
	}

}