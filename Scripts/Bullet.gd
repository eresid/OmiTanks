extends KinematicBody2D

var SPEED = 0;
var dir = ''
var motion = Vector2()
var isPlayerBullet = true
var startPoint

var speed = 1.1 # Global speed

var bulletType = [
	{"speed": 400, "left": 1, "right": 3, "up":2, "down":0, "damage": 1},
	{"speed": 800, "left": 5, "right": 7, "up":6, "down":4, "damage": 1}
]

func _ready():
	pass

func _physics_process(delta):
	position += motion * SPEED * delta * speed

func shoot(point, _dir, isPlayer, _type) :
	SPEED = bulletType[_type].speed
	dir = _dir;
	position = point
	startPoint = point
	isPlayerBullet = isPlayer
	
	var dist = 40
	
	if dir == 'up' :
		position.y -= dist
		motion = Vector2(0, -1);
		$Sprite.frame = bulletType[_type].up
	if dir == 'down' :
		position.y += dist
		motion = Vector2(0, 1);
		$Sprite.frame = bulletType[_type].down
	if dir == 'left' :
		position.x -= dist
		position.y -= 4 # fix horizontal bullet position
		motion = Vector2(-1, 0);
		$Sprite.frame = bulletType[_type].left
	if dir == 'right' :
		position.x += dist
		position.y -= 4 # fix horizontal bullet position
		motion = Vector2(1, 0);
		$Sprite.frame = bulletType[_type].right
