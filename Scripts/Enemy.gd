extends KinematicBody2D

onready var animationPlayer = $Explosion/AnimationPlayer

func _ready():
	pass

func _on_Area2D_area_entered(area):
	if (area.name == 'BulletArea2D'):
		area.get_parent().queue_free()

		$Sprite.visible = false
		$Ring.visible = false
		animationPlayer.play("Explosion")
		
		yield(get_tree().create_timer(0.6), "timeout")
		queue_free()
