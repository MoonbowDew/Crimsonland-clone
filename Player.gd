extends Sprite

var shotgun_tex = preload("res://survivor-idle_shotgun_0.png")
var AK_tex = preload("res://survivor-idle_rifle_0.png")
onready var timer = get_node("Reload_speed")

class_name Player

var current_weapon = Weapon.new()


var speed = 150
var velocity = Vector2()

var is_dead = false

var can_shoot = true

func _ready():
	Global.player = self
	
func _exit_tree():
	current_weapon.free()
	Global.player = null

func _process(delta):
	look_at(get_global_mouse_position())
	velocity.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	velocity = velocity.normalized()
	
	if is_dead == false:
		global_position += speed * velocity * delta
	
	if Input.is_action_pressed("click") and Global.node_creation_parent != null and can_shoot and is_dead == false:
		current_weapon.fire_weapon()
		$Reload_speed.start()
		can_shoot = false
	
	if Input.is_action_just_pressed("choose_shotgun"):
		self.set_texture(shotgun_tex)
		current_weapon.free()
		current_weapon = Shotgun.new()
		
		
		
	if Input.is_action_just_pressed("choose_AK"):
		self.set_texture(AK_tex)
		current_weapon.free()
		current_weapon = AK.new()
		

func _on_Reload_speed_timeout():
	timer.set_wait_time(current_weapon.reload_time)
	can_shoot = true


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy"):
		is_dead = true
		visible = false
		$Hitbox/Death_delay.start()


func _on_Death_delay_timeout():
	get_tree().reload_current_scene()
	
func get_current_weapon():
	return current_weapon
	


func _on_Hitbox_Nuke_area_entered(area):
	if area.is_in_group("Activate_Nuke"):
		for i in (get_tree().get_nodes_in_group("Enemy") ):
			i.hp = 0
