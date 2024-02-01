extends Node2D

var host_sprite

var pivot_below = false

var x_max = 1.5
var r_max = 10
const STOP_THRESHOLD = 0.1
const TWEEN_DURATION = 0.05
const RECOVERY_FACTOR = 2.0/3
const TRANSITION_TYPE = Tween.TRANS_SINE

var x = x_max
var r = r_max
func _ready():
	host_sprite = $Sprite2D
	
	while x> STOP_THRESHOLD:
		var tween = _tile_left(x,r)
		await tween.finished
		tween.tween_callback(queue_free)
		print(x)
		x *= RECOVERY_FACTOR
		r *= RECOVERY_FACTOR
		
		_recenter()
		
		tween = _tile_right(x,r)
		await tween.finished
		tween.tween_callback(queue_free)
		x *= RECOVERY_FACTOR
		r *= RECOVERY_FACTOR
		
		_recenter()


func _tile_left(x, r):
	var tween = get_parent().create_tween()
	tween.tween_property(host_sprite, 'position:x', host_sprite.position.x-x, TWEEN_DURATION).from(host_sprite.position.x).set_trans(TRANSITION_TYPE).set_ease(Tween.EASE_OUT)
	
	r = r if pivot_below else -r
	tween.tween_property(host_sprite, 'rotation_degrees', r, TWEEN_DURATION).from(0).set_trans(TRANSITION_TYPE).set_ease(Tween.EASE_OUT)
	
	return tween

func _tile_right(x, r):
	var tween = get_parent().create_tween()
	tween.tween_property(host_sprite, 'position:x', host_sprite.position.x+x, TWEEN_DURATION).from(host_sprite.position.x).set_trans(TRANSITION_TYPE).set_ease(Tween.EASE_OUT)
	
	r = r if pivot_below else -r
	tween.tween_property(host_sprite, 'rotation_degrees', r, TWEEN_DURATION).from(0).set_trans(TRANSITION_TYPE).set_ease(Tween.EASE_OUT)
	
	return tween

func _recenter():
	var tween = get_parent().create_tween()
	tween.tween_property(host_sprite, 'position:x', host_sprite.position.x, TWEEN_DURATION).from(host_sprite.position.x + x).set_trans(TRANSITION_TYPE).set_ease(Tween.EASE_IN)
	
	r = r if pivot_below else -r
	tween.tween_property(host_sprite, 'rotation_degrees', 0, TWEEN_DURATION).from(r).set_trans(TRANSITION_TYPE).set_ease(Tween.EASE_IN)
	
	return tween
