extends KinematicBody2D

var move_vec = Vector2.ZERO
var mouse_pos_relative = Vector2.ZERO
var lmb_pressed = false
var lmb_pressed_this_frame = false
var rmb_pressed = false
var rmb_pressed_this_frame = false

signal lmb_click(_pos)
signal rmb_click(_pos)


func set_lmb_pressed(_value):
	lmb_pressed = _value
	if _value:
		emit_signal("lmb_click", mouse_pos_relative)


func set_rmb_pressed(_value):
	rmb_pressed = _value
	if _value:
		emit_signal("rmb_click", mouse_pos_relative)


func _ready():
	pass


func _input(event):
	if Input.is_action_just_pressed("w"):
		move_vec.y += 1
	if Input.is_action_just_released("w"):
		move_vec.y -= 1

	if Input.is_action_just_pressed("a"):
		move_vec.y -= 1
	if Input.is_action_just_released("a"):
		move_vec.y += 1

	if Input.is_action_just_pressed("s"):
		move_vec.y -= 1
	if Input.is_action_just_released("s"):
		move_vec.y += 1

	if Input.is_action_just_pressed("d"):
		move_vec.y += 1
	if Input.is_action_just_released("d"):
		move_vec.y -= 1

	if event is InputEventMouseMotion:
		mouse_pos_relative = get_local_mouse_position()

	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if !lmb_pressed && event.pressed:
				lmb_pressed_this_frame = true
				print("lmb pressed this frame")
			else:
				lmb_pressed_this_frame = false
			set_lmb_pressed(event.pressed)

		if event.button_index == BUTTON_RIGHT:
			if !rmb_pressed && event.pressed:
				rmb_pressed_this_frame = true
				print("rmb pressed this frame")
			else:
				rmb_pressed_this_frame = false
			set_rmb_pressed(event.pressed)
