extends KinematicBody2D

export var velocidad_inicial_pelota = 300
export var acumulador_velocidad = 50
var velocidad_pelota = velocidad_inicial_pelota

var contador_hit = 0
var max_contador_hit = 12
var direccion = Vector2()

func _ready():
	randomize()
	set_direccion_inicial()

func set_direccion_inicial():
	var random_x = 0
	
	if randi()%10 < 5:
		random_x = 1
	else:
		random_x = -1
	
	direccion = Vector2(random_x, rand_range(-1, 1))
	direccion = direccion.normalized() * velocidad_pelota

func _physics_process(delta):
	var colision = move_and_collide(direccion * delta)
	if colision:
		direccion = direccion.bounce(colision.normal)
		print(colision.normal)
		if colision.collider.is_in_group("jugadores"):
			var y = direccion.y / 2 + colision.collider_velocity.y
			
			direccion = Vector2(direccion.x, y).normalized() * (velocidad_pelota + contador_hit * acumulador_velocidad)
			
			if contador_hit < max_contador_hit:
				contador_hit += 1
				
			$Ping.play()
		else:
			$Pong.play()

func reiniciar():
	position = Vector2(512,256)
	direccion = Vector2()
	contador_hit = 0



	
	
	
	