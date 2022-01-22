extends Node2D

var enemy_1 = preload("res://Zombie.tscn")
var enemy_2 = preload("res://Spider.tscn")
var bonus_nuke = preload("res://Nuke.tscn")

var enemy_count = 0

func _ready():
	Global.node_creation_parent = self
	
func _exit_tree():
	Global.node_creation_parent = null


func _on_Enemy_spawn_timer_timeout():
	var enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
	
	while enemy_position.x < 640 and enemy_position.x > -80 and enemy_position.y < 360 and enemy_position.y > -45:
		enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
		
	Global.instance_node(enemy_1, enemy_position, self)
	enemy_count += 1
	Global.instance_node(enemy_2, enemy_position, self)
	enemy_count += 1
	if enemy_count == 40:
		$Enemy_spawn_timer.stop()




func _on_Nuke_spawn_timer_timeout():
	var nuke_position = Vector2(rand_range(0, 640), rand_range(0, 360))
	
	Global.instance_node(bonus_nuke, nuke_position, self)
	if enemy_count == 40:
		$Nuke_spawn_timer.stop()
