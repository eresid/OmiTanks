extends KinematicBody2D

onready var animationPlayer = $Explosion/AnimationPlayer

var bulletType = 0
var SPEED = 0
var dir = ''
var motion = Vector2()
var isPlayerBullet = true
var startPoint

var wasCollided = false

var speed = 1.1 # Global speed

var bulletTypeData = [
	{"speed": 400, "left": 1, "right": 3, "up":2, "down":0, "damage": 1},
	{"speed": 800, "left": 5, "right": 7, "up":6, "down":4, "damage": 1}
]

func _ready():
	pass

func _physics_process(delta):
	if (wasCollided):
		return
	
	position += motion * SPEED * delta * speed

func shoot(point, _dir, isPlayer, _type) :
	bulletType = _type
	
	SPEED = bulletTypeData[_type].speed
	dir = _dir;
	position = point
	startPoint = point
	isPlayerBullet = isPlayer
	
	var dist = 40
	
	if dir == 'up' :
		position.y -= dist
		motion = Vector2(0, -1);
		$Sprite.frame = bulletTypeData[_type].up
	if dir == 'down' :
		position.y += dist
		motion = Vector2(0, 1);
		$Sprite.frame = bulletTypeData[_type].down
	if dir == 'left' :
		position.x -= dist
		position.y -= 4 # fix horizontal bullet position
		motion = Vector2(-1, 0);
		$Sprite.frame = bulletTypeData[_type].left
	if dir == 'right' :
		position.x += dist
		position.y -= 4 # fix horizontal bullet position
		motion = Vector2(1, 0);
		$Sprite.frame = bulletTypeData[_type].right

func _on_BulletArea2D_area_entered(area):
	if (area.name == 'EnemyArea2D' || area.name == 'ObjectArea2D'):
		wasCollided = true
		
		$Sprite.visible = false
		if (bulletType == 0):
			animationPlayer.play("projectileExplosion")
		else:
			animationPlayer.play("plasmaExplosion")
		
		yield(get_tree().create_timer(0.6), "timeout")
		queue_free()
