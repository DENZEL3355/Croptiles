
extends NodeState

@export var player : Player
@export var animated_sprite_2d : AnimatedSprite2D
@export var speed : int = 30


func _on_process(_delta : float) -> void: # виртуальный метод для обработки логики каждый кадр
	pass


func _on_physics_process(_delta : float) -> void:
	var direction = GameInputEvent.movement_input()
	
	if direction == Vector2.UP:
		animated_sprite_2d.play("walk_back")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
		
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")
		
	if direction != Vector2.ZERO:
		player.player_direction = direction
		
	player.velocity = direction * speed
	player.move_and_slide()
		
func _on_next_transitions() -> void: # виртуальный метод для проверки уловий перехода
	if !GameInputEvent.is_movement_input():
		transition.emit("Idle")
	

func _on_enter() -> void: # метод входа
	pass

func _on_exit() -> void: # метод выхода
	animated_sprite_2d.stop()
