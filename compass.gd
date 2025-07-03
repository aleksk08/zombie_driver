extends Node3D

# find the destination and rotate the direction indicator to point to it
@export var destination : Node3D
@onready var direction_indicator : Node3D = $direction_indicator

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#get the vactor direction normalised
	var target = destination.global_position
	target.y = global_position.y
	direction_indicator.look_at(target)
