extends Node3D

@onready var box =  load("res://Animation/rigid_body_3d.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_parent().create_tween()
	$RigidBody3D.scale = Vector3(0.5,0.5,0.5)
#	var result = scene.pack(node)
#	var scene = PackedScene.new()
	tween.tween_property($RigidBody3D, 'scale',Vector3(1,1,1), 0.5)
	for item in range(0, 3):
		var b = box.instantiate()
		b.position.x = (1 + item) *  item
		add_child(b)
	


func _on_rigid_body_3d_mouse_entered():
	print('dfg')
	
