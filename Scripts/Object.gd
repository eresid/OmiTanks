extends KinematicBody2D

var type = "wall"
var healthPoints = 4

func _ready():
	updateSprite()

func updateSprite():
	if (type != "wall"):
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

		$Sprite.visible = false
		# TODO animationPlayer.play("Explosion")
		
		yield(get_tree().create_timer(0.6), "timeout")
		queue_free()