extends TextureRect

var coords_head : Array = [
	[ 22.952, 83.271 ],  [ 28.385, 98.623 ],
	[ 53.168, 107.647 ], [ 72.998, 107.647 ],
	[ 99.546, 98.623 ],  [ 105.048, 83.271 ],
	[ 105.029, 55.237 ], [ 110.740, 47.082 ],
	[ 102.364, 36.104 ], [ 94.050, 40.940 ],
	[ 85.189, 34.445 ],  [ 85.963, 24.194 ],
	[ 73.507, 19.930 ],  [ 68.883, 28.936 ],
	[ 59.118, 28.936 ],  [ 54.494, 19.930 ],
	[ 42.039, 24.194 ],  [ 42.814, 34.445 ],
	[ 33.951, 40.940 ],  [ 25.637, 36.104 ],
	[ 17.262, 47.082 ],  [ 22.973, 55.237 ]
]

var head : PackedVector2Array

func float_array_to_Vector2Array(coords : Array) -> PackedVector2Array:
	# Convert the array of floats into a PackedVector2Array.
	var array : PackedVector2Array = []
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array

func _draw():
	var texture2d = ImageTexture.new()
	var godot_blue : Color = Color("478cbf")
	# We pass the PackedVector2Array to draw the shape.
#	print(texture.get_image().get_data())
#	print(texture2d.get_image().get_data())
	var opba = texture.get_image().get_data()
	draw_polygon(head, [ godot_blue ], [], texture2d)
	var mpba = texture.get_image().get_data()
	var i = 0;
#	print(opba == mpba)
	for v in opba:
		if(mpba[i] != v):
			print(i, mpba[i], v)
		i = i + 1
#	print(texture.get_image().get_data())
#	print(texture2d.get_image().get_data())
#	print(1)

func _ready():
	head = float_array_to_Vector2Array(coords_head);
