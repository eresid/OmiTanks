extends KinematicBody2D

var SPEED = 0;
var dir = ''
var motion = Vector2()
var isPlayerBullet = true
var startPoint

var speed = 1.1 # Global speed

func _ready():
	pass

func _physics_process(delta):
	position += motion * SPEED * delta * speed

func shoot(point, _dir, isPlayer, _speed) :
	SPEED = _speed
	dir = _dir;
	position = point
	startPoint = point
	isPlayerBullet = isPlayer
	
	var dist = 16
	
	if dir == 'up' :
		position.y -= dist
		motion = Vector2(0, -1);
		$Sprite.frame = 2
	if dir == 'down' :
		position.y += dist
		motion = Vector2(0, 1);
		$Sprite.frame = 0
	if dir == 'left' :
		position.x -= dist
		motion = Vector2(-1, 0);
		$Sprite.frame = 1
	if dir == 'right' :
		position.x += dist
		motion = Vector2(1, 0);
		$Sprite.frame = 3
