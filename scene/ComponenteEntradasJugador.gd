extends Node

#Crea un Nodo personalizado que puedo añadir como si fuera uno más del engine
class_name ComponenteEntradasJugador

var jugador

func _ready():
	jugador = get_parent()
	print(jugador)
	jugador.connect("actualizar", self, "entrada")

func entrada():
	if not "direccion" in jugador:
		return
	
	jugador.direccion = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		jugador.direccion.y -= 10
	if Input.is_action_pressed("ui_down"):
		jugador.direccion.y += 10