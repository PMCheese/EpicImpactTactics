// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_win(){
	if(char_health <= 0){
	
		if(!is_other_team){
			con_client.enemy_dead++;	
		}else{
			con_client.team_dead++;
		}
	
		if(con_client.team_dead == 5){
			
			room_goto(P2WinRoom)
			
			with(characters){
				instance_destroy(self)
			}
			
			with(instance_find(con_client, 0)){
				event_user(11)
			}
			
			
			return true;
		}else if(con_client.enemy_dead == 5){
			
			room_goto(P1WinRoom)
			
			with(characters){
				instance_destroy(self)
			}
			
			with(instance_find(con_client, 0)){
				event_user(11)
			}
			
			return true;
		}

		instance_destroy(self)
	
		return false;
	}
}