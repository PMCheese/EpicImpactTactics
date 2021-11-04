#macro five_star_rate 1
#macro four_star_rate 19
#macro three_star_rate 80

randomise()

var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left)

hover = lerp(hover, _hover, 0.1);

//check if button has a different name, if it has player1, make it your name, if it has a different name, do nothing
if(_click && con_client.premium_currency > 0){
	
	with(instance_find(con_client, 0)){
		event_user(10)
	}	
	
	with(characters){
		instance_destroy(self)	
	}
	
	var roll = irandom(99)+1
	
	if(roll == 1){
		with(instance_find(oPullMessage, 0)){
			event_user(2)
		}
	}else if(roll > 1) and (roll <= 19){
		with(instance_find(oPullMessage, 0)){
			event_user(1)
		}
	}else if(roll > 19) and (roll <= 100){
		with(instance_find(oPullMessage, 0)){
			event_user(0)
		}
	}
	
}

if(con_client.premium_currency == 0){
	text = "Not enough currency, feel free to bribe the dev for more"
}else{
	text = "PULL?"	
}