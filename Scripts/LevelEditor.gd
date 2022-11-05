extends Control

onready var fileNameLineEdit =  $TabContainer/General/FileNameLineEdit
onready var mapNameLineEdit =  $TabContainer/General/MapNameLineEdit
onready var mapDescriptionTextEdit = $TabContainer/General/MapDescriptionTextEdit

onready var widthSpinBox =  $TabContainer/General/WidthSpinBox
onready var heightSpinBox =  $TabContainer/General/HeightSpinBox

onready var deletingConfirmationDialog = $ConfirmationDialog

func _ready():
	LevelObject.level = FileHelper.loadLevel(LevelObject.levelNameToLoad)
	LevelObject.fileName = LevelObject.levelNameToLoad
	
	fileNameLineEdit.text = LevelObject.fileName
	mapNameLineEdit.text = LevelObject.level.name
	mapDescriptionTextEdit.text = (LevelObject.level.description)
	
	widthSpinBox.value = LevelObject.level.width
	heightSpinBox.value = LevelObject.level.height

func _on_FileNameLineEdit_text_changed(new_text):
	LevelObject.fileName = new_text

func _on_MapNameLineEdit_text_changed(new_text):
	LevelObject.level.name = new_text

func _on_MapDescriptionTextEdit_text_changed():
	LevelObject.level.description = mapDescriptionTextEdit.text

func _on_WidthSpinBox_value_changed(value):
	print(widthSpinBox.value)
	LevelObject.level.width = widthSpinBox.value

func _on_HeightSpinBox_value_changed(value):
	print(heightSpinBox.value)
	LevelObject.level.height = heightSpinBox.value

func _on_SaveButton_pressed():
	FileHelper.saveLevel(LevelObject.fileName, LevelObject.level)
	goBack()

func _on_CancelButton_pressed():
	goBack()

func _on_DeleteButton_pressed():
	deletingConfirmationDialog.popup()

func _on_ConfirmationDialog_confirmed():
	FileHelper.deleteLevel(LevelObject.levelNameToLoad)
	goBack()

func goBack():
	get_tree().change_scene("res://Scenes/LevelsList.tscn")
