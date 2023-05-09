extends Node

export (PackedScene) var astra


func _ready():
	randomize()

func _on_Timer_timeout():
	var mob_spawn_location = $AstraPath/AstraSpawnLocation
	mob_spawn_location.unit_offset = randf()
	
	var mob = astra.instance()
	add_child(mob)
	
	mob.position = mob_spawn_location.position
	
	var direction = mob_spawn_location.rotation + PI / 2
	direction += rand_range (-PI/ 4, PI/4)
	mob.rotation = direction
	
	var velocity = Vector2(rand_range(mob.min_speed, mob.max_speed),0)
	mob.linear_velocity = velocity.rotated(direction)
	
	#print(mob.count)
	
	mob.connect("destroyed",$Player2/CanvasLayer/UI/Score,"_on_Astra_destroyed")
	

	
	

