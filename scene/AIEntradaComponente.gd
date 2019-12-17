extends Node

#Crea un Nodo personalizado que puedo añadir como si fuera uno más del engine
class_name AIEntradaComponente

export(NodePath) var pelota_path
onready var pelota = get_node(pelota_path)

var raqueta

func _ready():
	raqueta = get_parent()
#	print(raqueta)
	raqueta.connect("actualizar", self, "calcular_velocidad")

func calcular_velocidad():
	if not "direccion" in raqueta:
		return
	
	raqueta.direccion = Vector2(0, get_direccion_pelota())

func get_direccion_pelota():
	if abs(raqueta.position.y - pelota.position.y) > 20:
		if raqueta.position.y < pelota.position.y:
			return 1
		else:
			return -1
	else:
		return 0