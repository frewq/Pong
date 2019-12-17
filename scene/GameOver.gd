extends Control

signal jugar_de_nuevo
signal salir


func _on_BotonJugarOtraVez_pressed():
	emit_signal("jugar_de_nuevo")


func _on_BotonSalir_pressed():
	emit_signal("salir")
