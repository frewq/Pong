extends Node2D

signal arco_derecho
signal arco_izquierdo

func _on_ArcoIzquierda_body_entered(body):
	emit_signal("arco_izquierdo")


func _on_ArcoDerecha_body_entered(body):
	emit_signal("arco_derecho")
