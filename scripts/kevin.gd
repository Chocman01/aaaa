extends KinematicBody2D
const PauseScreen = preload("res://scenes/pause_menu2.tscn")
var velocity = Vector2()
var SPEED = 200
var GRAVITY=10
var JUMPSPEED=200
export var stomp_impulse= 200

onready var sprite = $Sprite
onready var anim_player = $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback= anim_tree.get("parameters/playback")
onready var pivot = $pivote
onready var footsteps= $footsteps
onready var polvito = $pivote/polvito
# Called when the node enters the scene tree for the first time.
func _ready():
	anim_tree.active = true

func _on_Enemy_detector_area_entered(area):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	var move_input=Input.get_axis("move_left","move_right")
	
	velocity.x= move_input * SPEED 
	
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("move_up"):
		velocity.y = -JUMPSPEED 
		
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	for i in get_slide_count():
		var collider = get_slide_collision(i)
	
	#ANIMACIONES ANIMACIONES ANIMACIONES ANIMACIONES ANIMACIONES ANIMACIONES
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
			pivot.scale.x= 1
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		pivot.scale.x = -1
	if is_on_floor():
		if abs(velocity.x) > 10:
			playback.travel("run")
		else: 
			playback.travel("idle")
	else:
		if velocity.y < 0:
			playback.travel("jump")	
		else:
			playback.travel("fall")		
		

		
func calculate_stomp_velocity(velocity, impulse: float): #ESTO NO HACE NADA
	pass

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		var pause_menu = PauseScreen.instance()
		add_child(pause_menu)
			
	


