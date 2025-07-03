extends Node3D

signal player_entered_destination

## fires the "player_entered_destination" signal if player goes into the area3d
func _on_destination_body_entered(body: Node3D) -> void:
	if body.name == "car":
		player_entered_destination.emit()
