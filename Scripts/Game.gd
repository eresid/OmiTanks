extends Node2D

func _ready():
	var level = FileHelper.loadLevel("level01")
	print(level)
