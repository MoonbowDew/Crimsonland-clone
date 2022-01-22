extends Sprite

var bullet = preload("res://Bullet.tscn")


class_name Weapon

var reload_time = 0.1

func fire_weapon():
	Global.instance_node(bullet, Global.player.global_position, Global.node_creation_parent)
