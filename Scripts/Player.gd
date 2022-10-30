extends KinematicBody2D

var speed = 200
var baseBulletSpeed = 400
const CELL_SIZE = 60

# need for direction limitation
var direction = "up"
var isMoving = false
var isRotating = false

var velocity = Vector2()

var Bullet = preload("res://Scenes/Bullet.tscn")

func _ready():
	self.position = Vector2(360 - 6, 180 - 6)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up") && (direction == "up" || !isMoving):
		velocity = Vector2(0, -speed);
		updateSprite("up")
		
	elif Input.is_action_pressed("down") && (direction == "down" || !isMoving):
		velocity = Vector2(0, speed);
		updateSprite("down")
		
	elif Input.is_action_pressed("left") && (direction == "left" || !isMoving):
		velocity = Vector2(-speed, 0);
		updateSprite("left")
		
	elif Input.is_action_pressed("right") && (direction == "right" || !isMoving):
		velocity = Vector2(speed, 0);
		updateSprite("right")
		
	else:
		# moveToPosition()
		#if (!needMoveForvard()):
			velocity = Vector2(0, 0);
			isMoving = false
	
	var x = self.position.x
	var y = self.position.y
	print(x,"-", y)
	
	if Input.is_action_just_pressed("ui_select"):
		var bul = Bullet.instance()
		bul.shoot(get_position(), direction, true, baseBulletSpeed)
		$"../bulletList".add_child(bul)
	
	if (!isRotating):
		move_and_slide(velocity)
	
	# Limit the coordinates so that the player does not go beyond the map
	position.x = clamp(position.x, 0, 20 * 30)
	position.y = clamp(position.y, 0, 20 * 30)

func needMoveForvard():
	var x = self.position.x
	var y = self.position.y
	
	if (fmod(x, CELL_SIZE) == 0 && fmod(y, CELL_SIZE) == 0):
		return false
		
	return true

func updateSprite(newDirection):
	if (direction == newDirection):
		return
	
	isRotating = true
	
	var oldDirection = direction
	direction = newDirection
	
	$Sprite.startRotation(oldDirection, newDirection)
	
	isRotating = true
	yield(get_tree().create_timer(0.3), "timeout")
	isRotating = false
	isMoving = true
