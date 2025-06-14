extends Area3D
class_name Zombie
@onready var ragdoll : PhysicalBoneSimulator3D = $ZombieIdle/Skeleton3D/PhysicalBoneSimulator3D

signal ragdoll_activated

# test function
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#print("Key Pressed")
		#activate_ragdoll()

func activate_ragdoll():
	if not ragdoll.is_simulating_physics():
		ragdoll.physical_bones_start_simulation()
		ragdoll_activated.emit()
	

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		activate_ragdoll()
