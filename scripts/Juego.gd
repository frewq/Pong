extends Node

onready var hud = get_node("HUD")

var puntaje_jugador_uno = 0
var puntaje_jugador_dos = 0

var puntaje_maximo = 3

func _ready():
	actualizar_puntaje()
	$TimerInicial.start()
	
func _process(delta):
	if $TimerInicial.time_left > 1:
		hud.get_node("CuentaRegresiva/CenterContainer/TextoAccion").set_text(str(round($TimerInicial.time_left)))


func _on_Cancha_arco_derecho():
	puntaje_jugador_uno += 1
	print("Gol jugador 1")
	actualizar_puntaje()
	if puntaje_jugador_uno < puntaje_maximo:
		nuevo_round()
	else:
		mostrar_ganador("¡Ganaste")


func _on_Cancha_arco_izquierdo():
	puntaje_jugador_dos += 1
	print("Gol jugador 2")
	actualizar_puntaje()
	if puntaje_jugador_dos < puntaje_maximo:
		nuevo_round()
	else:
		mostrar_ganador("Perdiste")

func nuevo_round():
	$Pelota.reiniciar()
	$Jugador.set_position(Vector2(50,256))
	$Jugador2.set_position(Vector2(974,256))
	hud.get_node("CuentaRegresiva").set_visible(true)
	$TimerInicial.start()
	
func juego_nuevo():
	puntaje_jugador_uno = 0
	puntaje_jugador_dos = 0
	actualizar_puntaje()
	$GameOver.set_visible(false)
	nuevo_round()

func _on_TimerInicial_timeout():
	hud.get_node("CuentaRegresiva").set_visible(false)
	$Pelota.set_direccion_inicial()
	
func actualizar_puntaje():
	hud.get_node("MostrarPuntaje/PuntajeJudadorUno").set_text(str(puntaje_jugador_uno))
	hud.get_node("MostrarPuntaje/PuntajeJugadorDos").set_text(str(puntaje_jugador_dos))

func mostrar_ganador(mensaje):
	$GameOver.set_visible(true)
	$GameOver.get_node("VBoxContainer/MensajeResultado").set_text(mensaje)

func _on_GameOver_jugar_de_nuevo():
	juego_nuevo()

func _on_GameOver_salir():
	get_tree().quit()
