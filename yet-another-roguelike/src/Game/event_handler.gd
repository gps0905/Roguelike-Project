class_name EventHandler
extends Node



const DELAY_TIME: float = 0.2 
const BUFFER_TIME: float = 0.08


## Tracks remaining wait time
var move_delay: float = 0.0  
var buffer_timer: float = 0.0
var is_buffering: bool = false
var buffered_direction = Vector2i.ZERO

## Map input to an action
func get_action() -> Action:
	var action: Action = null

	if move_delay <= 0:
		var direction = Vector2i.ZERO
	  
		if Input.is_action_pressed("ui_up"): direction.y -= 1
		if Input.is_action_pressed("ui_down"): direction.y += 1
		if Input.is_action_pressed("ui_left"): direction.x -= 1
		if Input.is_action_pressed("ui_right"): direction.x += 1
			
		if !(direction == Vector2i.ZERO):
			if !is_buffering:
				# Start buffering — open the window for a second key
				is_buffering = true
				buffer_timer = BUFFER_TIME
				
			# Keep updating the buffered direction while keys are held
			buffered_direction = direction
			
		if is_buffering && buffer_timer <= 0:
			is_buffering = false
			if buffered_direction != Vector2i.ZERO:
				action = MovementAction.new(buffered_direction.x, buffered_direction.y)
				move_delay += DELAY_TIME
				buffered_direction = Vector2i.ZERO


	if Input.is_action_just_pressed("ui_cancel"):
		action = EscapeAction.new()
	
	return action

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if move_delay > 0:
		move_delay -= delta
	if is_buffering:
		buffer_timer -= delta
