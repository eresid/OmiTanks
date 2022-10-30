extends Node

func _ready():
	pass

func loadLevel(mapName):
	var file = File.new()
	file.open("res://Levels/%s.map" % mapName, File.READ)
	var mapAsString = file.get_as_text()
	file.close()
	return JSON.parse(mapAsString).result
