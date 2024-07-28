extends Node2D

@onready var villager = $Pool/Villager
@onready var home = $Areas/Home

func _ready():
	randomize()
	print(villager.position)

func _process(delta):
	move_one_pixel_towards_target(delta)
	
func move_one_pixel_towards_target(delta):
	var direction = home.position - villager.position
	if direction.length() > 1:
		direction = direction.normalized()
		villager.position += direction * villager.speed * delta
