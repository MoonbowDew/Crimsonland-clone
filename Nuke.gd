extends Sprite


func _on_Hitbox_Nuke_area_entered(area):
	var Enemy_arr_1 = get_tree().get_nodes_in_group("Zombie")
	var Enemy_arr_2 = get_tree().get_nodes_in_group("Spider")
	if area.is_in_group("Activate_Nuke"):
		for i in (Enemy_arr_1):
			i.hp = 0
		for i in (Enemy_arr_2):
			i.hp = 0
		visible = false
		queue_free()
		
