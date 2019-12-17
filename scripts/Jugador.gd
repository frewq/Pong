extends KinematicBody2D

signal actualizar

export var velocidad = 500
var direccion = Vector2()

func _ready():
	pass

func _process(delta):
	emit_signal("actualizar")

func _physics_process(delta):
	if direccion.length() > 0:
		direccion = direccion.normalized() * velocidad
		move_and_collide(direccion * delta)