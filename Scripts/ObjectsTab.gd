extends Tabs

var ObjectTscn = preload("res://Scenes/Object.tscn")

func loadMap(mapName):
	var level = FileHelper.loadLevel(mapName)
	
	for item in level.objects:
		var object = ObjectTscn.instance()
		object.drawObject(item)
		$Objects.add_child(object)
