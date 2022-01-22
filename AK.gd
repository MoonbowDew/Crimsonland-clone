extends Weapon

class_name AK


func _init(newReloadTime := 0.1):
	reload_time = newReloadTime

func fire_weapon():
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent)
