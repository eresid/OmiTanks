extends KinematicBody2D

var ExplosionAnimation = preload("res://Scenes/ExplosionAnimation.tscn")

var healthPoints = 3

func _ready():
	pass

func _on_Area2D_area_entered(area):
	if (area.name == 'BulletArea2D'):
		#area.get_parent().queue_free() # remove bullet if need

		healthPoints -= 1
		if (healthPoints > 0):
			return
		
		queue_free()
		spawnExplosionAnimation()
		
func spawnExplosionAnimation():
	var explosionAnimation = ExplosionAnimation.instance()
	explosionAnimation.play(Vector2(self.position.x - 9, self.position.y - 9))
	$"../DynamicObjects".add_child(explosionAnimation)
