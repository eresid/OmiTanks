extends Sprite

onready var animationPlayer = $AnimationPlayer

func _ready():
	pass

func startRotation(oldDir, newDir):
	if (oldDir == "up" && newDir == "left"):
		animationPlayer.play("UpToLeft")
	elif (oldDir == "down" && newDir == "left"):
		animationPlayer.play("DownToLeft")
	elif (oldDir == "left" && newDir == "up"):
		animationPlayer.play("LeftToUp")
	elif (oldDir == "right" && newDir == "up"):
		animationPlayer.play("RightToUp")
	elif (oldDir == "up" && newDir == "right"):
		animationPlayer.play("UpToRight")
	elif (oldDir == "down" && newDir == "right"):
		animationPlayer.play("DownToRight")
	elif (oldDir == "left" && newDir == "down"):
		animationPlayer.play("LeftToDown")
	elif (oldDir == "right" && newDir == "down"):
		animationPlayer.play("RightToDown")
	elif (oldDir == "left" && newDir == "right"):
		animationPlayer.play("LeftToRight")
	elif (oldDir == "right" && newDir == "left"):
		animationPlayer.play("RightToLeft")
	elif (oldDir == "up" && newDir == "down"):
		animationPlayer.play("UpToDown")
	elif (oldDir == "down" && newDir == "up"):
		animationPlayer.play("DownToUp")
