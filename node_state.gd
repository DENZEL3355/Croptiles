class_name NodeState  # объявляем базавый класс для всех состояний
extends Node

@warning_ignore("unused_signal")  # игнорируем предупреждение о неиспользуемом сигнале

signal transition

func _on_process(_delta : float) -> void: # виртуальный метод для обработки логики каждый кадр
	pass


func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transition() -> void: # виртуальный метод для проверки уловий перехода
	pass

func _on_enter() -> void: # метод входа
	pass

func _on_exit() -> void: # метод выхода
	pass
