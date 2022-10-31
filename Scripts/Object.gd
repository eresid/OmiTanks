extends KinematicBody2D

var ExplosionAnimation = preload("res://Scenes/ExplosionAnimation.tscn")

var type = "brickWall"
var healthPoints = 4

func _ready():
	pass

func drawObject(item):
	type = item.type
	healthPoints = item.healthPoints
	position.x = item.posX * Global.CELL_SIZE
	position.y = item.posY * Global.CELL_SIZE
		
	updateSprite()

func updateSprite():
	if (type != "brickWall"):
		return
	
	randomize()
	
	if (healthPoints == 4):
		$Sprite.frame = int(rand_range(1, 3))
	elif (healthPoints == 3):
		$Sprite.frame =  int(rand_range(3, 5))
	elif (healthPoints == 2):
		$Sprite.frame = int(rand_range(5, 7))
	elif (healthPoints == 1):
		$Sprite.frame = int(rand_range(7, 9))

func _on_ObjectArea2D_area_entered(area):
	if (area.name == 'BulletArea2D'):
		healthPoints -= 1
		if (healthPoints > 0):
			updateSprite()
			return

		queue_free()
		spawnExplosionAnimation()

func spawnExplosionAnimation():
	var explosionAnimation = ExplosionAnimation.instance()
	explosionAnimation.play(Vector2(self.position.x - 15, self.position.y - 15))
	$"../../DynamicObjects".add_child(explosionAnimation)
