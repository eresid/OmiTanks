extends Node

func loadLevel(mapName):
	var file = File.new()
	file.open("res://Levels/%s" % mapName, File.READ)
	var mapAsString = file.get_as_text()
	file.close()
	return JSON.parse(mapAsString).result

func saveLevel(mapName, level):
	var saveLevelFile = File.new()
	saveLevelFile.open("res://Levels/%s" % mapName, File.WRITE)
	saveLevelFile.store_string(to_json(level))
	saveLevelFile.close()

func listOfFilesFromDirectory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files
