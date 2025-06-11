extends Control
class_name IngameUI

signal timer_ended
@export var level_time := 120
@onready var timer_label : Label = $Panel/TimeLabel
@onready var score_label : Label = $Panel/ScoreLabel

func _on_timer_timeout() -> void:
	level_time -= 1
	_set_label_text()
	if level_time <= 0:
		timer_ended.emit()


func set_score_label(score : int):
	score_label.text = "Score: "+str(score)


func _set_label_text():
	var m = level_time / 60
	var s = level_time%60
	timer_label.text = (str(m)+":"+str(s))
