extends Node2D

func play(position):
	self.position = position
	$Sprite/AnimationPlayer.play("Explosion")

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
