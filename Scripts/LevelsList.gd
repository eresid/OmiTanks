extends Control

var levelsList = []

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func _ready():
	levelsList = FileHelper.listOfFilesFromDirectory("Levels")
	
	for i in range(levelsList.size()):
		get_node("ItemList").add_item(levelsList[i], null, true)

func _on_ItemList_item_selected(index):
	LevelObject.levelNameToLoad = levelsList[index]
	get_tree().change_scene("res://Scenes/LevelEditor.tscn")


