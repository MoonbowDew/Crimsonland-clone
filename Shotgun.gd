extends Weapon

class_name Shotgun

func _init(newReloadTime := 0.4):
	reload_time = newReloadTime

func fire_weapon():
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent, -7 * 2)
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent, -5 * 2)
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent, -3 * 2)
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent, -1 * 2)
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent, 0 * 2)
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent, 1 * 2)
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent, 3 * 2)
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent, 5 * 2)
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent, 7 * 2)
