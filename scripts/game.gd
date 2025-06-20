extends Node

@export var level_time := 120
var zombies : Array[Node]

@export var ui : IngameUI
var score : int = 0
var total_num_zombies
#is the game running and not already won or lost?
var playing = true

@onready var time_label : Label = $in_game_ui/Panel/TimeLabel
@onready var score_label : Label = $in_game_ui/Panel/ScoreLabel
@onready var win_panel : Panel = $in_game_ui/WinPanel
@onready var lose_panel : Panel = $in_game_ui/LosePanel

func _ready() -> void:
	zombies = get_tree().get_nodes_in_group("zombies")
	total_num_zombies = len(zombies)
	score = total_num_zombies
	set_score_text()
	for zombie in zombies:
		var z : Zombie = zombie
		z.ragdoll_activated.connect(zombie_killed)
	#hide the win and lose
	win_panel.hide()
	lose_panel.hide()
		

func zombie_killed():
	print("Zombie Killed")
	score -= 1
	ui.set_score_label(score)
	#win scene!
	if score <= 0 and playing:
		print("You win!")
		playing = false
		win_panel.show()
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _set_label_text():
	var m = level_time / 60
	var s = level_time % 60
	time_label.text = (str(m)+":"+str(s))

func set_score_text():
	score_label.text = "Score: "+str(score)

func _on_timer_timeout() -> void:
	level_time -= 1
	_set_label_text()
	if level_time <= 0 and playing:
		#we lost
		playing = false
		lose_panel.show()
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
