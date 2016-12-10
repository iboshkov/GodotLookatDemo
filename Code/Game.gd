extends Spatial;

var dead_zone = Vector2(20, 20)
var screen_size

var speed = 5
var minion = null
var camera = null
var anim_player = null
var camera_pivot = null

func _input(ev):
	pass

func _process(delta):
	var pos = minion.get_translation ()
	var moveDir = Vector3(0, 0, 0)
	if Input.is_key_pressed(KEY_W):
		moveDir.z = 1
	elif Input.is_key_pressed(KEY_S):
		moveDir.z = -1
	if Input.is_key_pressed(KEY_A):
		moveDir.x = 1
	elif Input.is_key_pressed(KEY_D):
		moveDir.x = -1
	
	var a = pos
	var b = camera.get_global_transform().origin
	a.y = 0
	b.y = 0
	
	var forward = (a - b).normalized()
	var right = Vector3(forward.z, forward.y, -forward.x)
	var dir = moveDir.z * forward + moveDir.x * right
	dir.y = 0
	
	var offset = dir * speed * delta
	minion.global_translate(offset)
	minion.look_at(-forward, Vector3(0, 1, 0))
	
	camera_pivot.set_translation(minion.get_global_transform().origin)

func _ready():
	screen_size = get_viewport().get_rect().size
	minion = get_node("Actor")
	camera = get_node("Cam/Camera")
	camera_pivot = get_node("Cam")
	
	#anim_player = get_node("AnimationPlayer")
	#anim_player.play("Armature|Armature|Run|Armature|Run")
	set_process_input(true)
	set_process(true)