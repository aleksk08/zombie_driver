extends Node

var zombies : Array[Node]

@export var ui : IngameUI
var score : int = 0
var total_num_zombies

func _ready() -> void:
	zombies = get_tree().get_nodes_in_group("zombies")
	total_num_zombies = len(zombies)
	for zombie in zombies:
		var z : Zombie = zombie
		z.ragdoll_activated.connect(zombie_killed)
		

func zombie_killed():
	print("Zombie Killed")
	score += 1
	ui.set_score_label(score)
