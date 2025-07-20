extends NodeState

@export var player : Player
@export var animated_sprite_2d : AnimatedSprite2D 

   
func _on_process(_delta : float) -> void: # виртуальный метод для обработки логики каждый кадр
	pass


func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void: # виртуальный метод для проверки уловий перехода
	if !animated_sprite_2d.is_playing(): # если анимаций нет, то переходим в состояние спокойствия
		transition.emit("Idle")
	pass

func _on_enter() -> void: # метод входа   что мы делаем когда вошли в метод
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("tilling_back")
		
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("tilling_left")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("tilling_right")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("tilling_front")
	else :
		animated_sprite_2d.play("tilling_front")
	

func _on_exit() -> void: # метод выхода    что мы делаем когда выходим из метода
	animated_sprite_2d.stop()
