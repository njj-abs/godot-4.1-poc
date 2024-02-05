extends Node2D

@onready var Sprite = load("res://Animation/node_2d.tscn")

func _ready():
	for i in range(1,4):
		var sprite = Sprite.instantiate()
		sprite.position.y = 100
		sprite.position.x = sprite.position.x + 150 * (i)
		add_child(sprite)
