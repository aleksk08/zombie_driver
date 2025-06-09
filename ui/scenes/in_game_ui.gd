extends Control

signal timer_ended
@export var level_time := 120
@onready var timer_label : Label = $Panel/Label


func _on_timer_timeout() -> void:
	level_time -= 1
	_set_label_text()
	if level_time <= 0:
		timer_ended.emit()


func _set_label_text():
	var m = level_time / 60
	var s = level_time%60
	timer_label.text = (str(m)+":"+str(s))
