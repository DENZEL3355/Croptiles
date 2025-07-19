  # объявляем базавый класс для всех состояний
extends NodeState

@export var player : Player
@export var animated_sprite_2d : AnimatedSprite2D

var direction : Vector2


func _on_process(_delta : float) -> void:
	 # виртуальный метод для обработки логики каждый кадр
	pass


func _on_physics_process(_delta : float) -> void:
	

		
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
		
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	else :
		animated_sprite_2d.play("idle_front")
	
func _on_next_transitions() -> void: # виртуальный метод для проверки уловий перехода
	GameInputEvent.movement_input()
	
	if GameInputEvent.is_movement_input():
		transition.emit("Walk")
	pass

func _on_enter() -> void: # метод входа
	pass

func _on_exit() -> void: # метод выхода
	animated_sprite_2d.stop()
