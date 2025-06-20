extends AudioStreamPlayer3D

#create a list of potential sounds
@export var sounds : Array[AudioStream]

## Plays one of the clip at random
func play_random():
	var n = randi_range(0,len(sounds)-1)
	stream = sounds[n]
	play()
	
