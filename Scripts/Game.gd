extends Node2D

var ObjectTscn = preload("res://Scenes/Object.tscn")

func _ready():
	loadMap("level01.map")

func loadMap(mapName):
	var level = FileHelper.loadLevel(mapName)
	
	for item in level.objects:
		var object = ObjectTscn.instance()
		object.drawObject(item)
		$Objects.add_child(object)
