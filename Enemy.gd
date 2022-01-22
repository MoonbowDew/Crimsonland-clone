extends Sprite
class_name Enemy

var speed : int = 0

var velocity = Vector2()

var hp : int = 3

var blood_particles = preload("res://Blood_particles.tscn")

func _init(newSpeed := 0):
	speed = newSpeed
	add_to_group("Enemy")

func _process(delta):
	if Global.player != null:
		velocity = global_position.direction_to(Global.player.global_position)
		look_at(Global.player.global_position)
		
	global_position += velocity * speed * delta
	
	if hp <= 0:
		if Global.node_creation_parent != null:
			velocity = -velocity * 6
			var blood_particles_instance = Global.instance_node(blood_particles, global_position, Global.node_creation_parent)
			blood_particles_instance.rotation = velocity.angle()
		queue_free()


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager"):
		hp -= 1
		area.get_parent().queue_free()
