extends Node

func loadLevel(levelName):
	var file = File.new()
	file.open("res://Levels/%s" % levelName, File.READ)
	var levelAsString = file.get_as_text()
	file.close()
	return JSON.parse(levelAsString).result

func saveLevel(levelName, level):
	var saveLevelFile = File.new()
	saveLevelFile.open("res://Levels/%s" % levelName, File.WRITE)
	saveLevelFile.store_string(to_json(level))
	saveLevelFile.close()

func deleteLevel(levelName):
	var dir = Directory.new()
	dir.remove("res://Levels/%s" % levelName)

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
