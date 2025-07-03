extends Node

@export var level_time := 120
@onready var time_left := level_time
var zombies : Array[Node]

@export var ui : IngameUI
var score : int = 0
var total_num_zombies
#is the game running and not already won or lost?
var playing = true

@onready var time_label : Label = $in_game_ui/Panel/TimeLabel
@onready var win_panel : Panel = $in_game_ui/WinPanel
@onready var lose_panel : Panel = $in_game_ui/LosePanel

func _ready() -> void:
	zombies = get_tree().get_nodes_in_group("zombies")
	for zombie in zombies:
		var z : Zombie = zombie
		z.ragdoll_activated.connect(zombie_killed)
	_set_label_text()
	#hide the win and lose
	win_panel.hide()
	lose_panel.hide()
		

func zombie_killed():
	print("Zombie Killed")
	time_left += 10
	
	
func _set_label_text():
	var m = time_left / 60
	var s = time_left % 60
	time_label.text = ("%02d:%02d" % [m,s])


func _on_timer_timeout() -> void:
	time_left -= 1
	_set_label_text()
	if time_left <= 0 and playing:
		#we lost
		playing = false
		lose_panel.show()
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_player_reached_destination() -> void:
	print("You win!!")
	playing = false
	win_panel.show()
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
