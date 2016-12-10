extends Spatial;

var dead_zone = Vector2(20, 20)
var screen_size
var moveDir = Vector3(0, 0, 0)
var speed = 5

func _input(ev):
	if (ev.type == InputEvent.MOUSE_BUTTON):
		print("Mouse Click/Unclick at: ", ev.pos)
	elif (ev.type == InputEvent.MOUSE_MOTION):
		#print("Mouse Motion at: ", ev.pos)
		#print("Mouse Motion at: ", ev.relative_pos)
		#self.rotate_y((ev.relative_x * 3.14) / 180.0)
		self.global_rotate(Vector3(0, 1, 0), (ev.relative_x * 3.14) / 180.0)
		self.rotate(Vector3(1, 0, 0), (ev.relative_y * 3.14) / 180.0)
   # Print the size of the viewport
func _process(delta):
	pass

func _ready():
	screen_size = get_viewport().get_rect().size
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	set_process_input(true)
	set_process(true)