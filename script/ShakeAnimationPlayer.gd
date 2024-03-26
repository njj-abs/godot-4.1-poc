extends Node2D

@onready var Sprite = load("res://Animation/sprite_2d.tscn")

func _ready():
	for i in range(1,4):
		var sprite = Sprite.instantiate()
		sprite.position.x = sprite.position.x + 150 * (i)
		sprite.position.y = 200
		print(sprite.position.x, i)
		print(i)
		add_child(sprite)
