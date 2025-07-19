class_name NodeStateMaсhine # определяем новый класс 
extends Node # наследуемся от базового нода

@export var initial_node_state : NodeState # первоначальная нода состояния
# Called when the node enters the scene tree for the first time.

var node_states : Dictionary = {} # словарь для хранения всех состояний в формате { "имя" : состояние}
var current_node_state : NodeState # текущее активное состояние \ экземпляр класса nodeState
var current_node_state_name : String # имя текущего состояния для удобного доступа



func _ready(): # при запуске 1 раз
	#print("Connected states: ", get_children().filter(func(c): return c is NodeState))
	for child in get_children():# перебираем все дочерние элементы этого узла
		if child is NodeState: # проверяем является ли child состоянием ( наследником NodeState)
			node_states[child.name.to_lower()] = child # добавляем состояние в словарь , где ключ - это имя в нижнем регистре 
			child.transition.connect(transition_to) #  подключаем сигнал transition  к своему transition_to                подключаемся к методу, который позволяет переключится из одного состояния к другому
	if initial_node_state:   # если начальное состояние равно True
		initial_node_state._on_enter() # вызываем у состояния метод входа
		current_node_state = initial_node_state

func _physics_process(delta):
	if current_node_state: # если текущее состояние есть, то 
		current_node_state._on_physics_process(delta) # обробатываем физику состояния
		current_node_state._on_next_transitions() # проверяем возможные переходы
		#print("Current State: ", current_node_state_name) #  выводим в консоль текущее состояние

func _process(delta): #вызывается каждый кадр
	if current_node_state :# если есть  текущее состояние 
		current_node_state._on_process(delta) # передаем ему функцию процесс и дельту времени
		
	
	
	
	
	
func transition_to(node_state_name : String) : # метод для переключения между состояниями 
	  
	if node_state_name == current_node_state.name.to_lower(): # если запрошено текущеесостояние, то просто возвращаемся и игнорируем
		return
		
	var new_node_state = node_states.get(node_state_name.to_lower()) # получаем новое состояние из словаря по имени , где имя ключ в методе  get(ключ)
	
	if !new_node_state :  # если нового состояния нет folse, то : djpdhfoftvcz ds[jlbv
		return
		
	if current_node_state: # если есть текущее состояние, то вызываем метод выхода
		current_node_state._on_exit()
	
	new_node_state._on_enter()# вызываем метод входа для нового состояния 
	
	current_node_state = new_node_state # обновляем текущее состояние
	current_node_state_name = current_node_state_name.to_lower()
	
	
	
	
	
