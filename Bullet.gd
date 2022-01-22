extends Sprite

class_name Bullet

var velocity = Vector2(1, 0)
var speed = 250
var deviation_angle = 0

var look_once = true

func _init(newDeviation := 0):
	deviation_angle = newDeviation

func _process(delta):
	if look_once:
		look_at(get_global_mouse_position())
		look_once = false
	global_position += velocity.rotated(rotation + deg2rad(deviation_angle)) * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
