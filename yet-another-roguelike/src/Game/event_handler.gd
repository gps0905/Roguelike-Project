class_name EventHandler
extends Node


## Map input to an action
func get_action() -> Action:
	var action: Action = null

	var direction = Vector2i.ZERO
	
	if Input.is_action_just_pressed("ui_up"):
		direction.y -= 1
	elif Input.is_action_just_pressed("ui_down"):
		direction.y += 1
	elif Input.is_action_just_pressed("ui_left"):
		direction.x -= 1
	elif Input.is_action_just_pressed("ui_right"):
		direction.x += 1
	
	while true:
		action = MovementAction.new(direction.x, direction.y)
	
	
	if Input.is_action_just_pressed("ui_cancel"):
		action = EscapeAction.new()
	
	return action

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
