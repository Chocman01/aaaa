extends KinematicBody2D

class_name PlayerR
onready var anim_tree = $AnimationTree
const PauseScreen = preload("res://scenes/pause_menu2.tscn")
func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		var pause_menu = PauseScreen.instance()
		add_child(pause_menu)
onready var animation_state = $AnimationTree.get("parameters/playback")
onready var raycast = $RayCast2D #Used to check if player is on top of box
								 #don't transition to push state if on box

export(int) var gravity = 1000
export(int) var jump_speed = -300
export(int) var walk_speed: int = 200

var rigid_push: Vector2 = Vector2(225, 0)

# Handle slopes
var snap_length: int = 2
var snap_direction: Vector2 = Vector2.DOWN
var snap_vector = snap_direction * snap_length
var floor_max_angle = deg2rad(65)

var velocity: Vector2
var direction = "right"

var state
enum states {
	IDLE,
	WALK,
	FALL
	JUMP
}



func _ready() -> void:
	anim_tree.active = true
	state = states.IDLE
	get_node("HitboxPosition/Hitbox/CollisionShape2D").disabled = true
	
	
func update_direction(input_direction_x) -> void:
	if input_direction_x > 0:
		set_direction_right()
	elif input_direction_x < 0:
		set_direction_left()


func set_direction_right() -> void:
	direction = "right"
	$Sprite.flip_h = false
	$HitboxPosition.rotation_degrees = 0


func set_direction_left() -> void:
	direction = "left"
	$Sprite.flip_h = true
	$HitboxPosition.rotation_degrees = 180
	

func apply_gravity(delta) -> void:
	velocity.y += gravity * delta











# Declare member variables here. Examples:
# var a = 2
# var b = "text"


