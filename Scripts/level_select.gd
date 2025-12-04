extends Control


@onready var level_list: VBoxContainer = $LevelList

var LevelButtonScene = preload("res://Scenes/Components/UI/level_button.tscn")

func _ready():
	display_levels()

func display_levels():
	var i = 0
	for level in LevelDao.get("levels"):
		if i == 0:
			create_level_button(level)
			#i += 1

func load_level(level: Level):
	print("Loading Level: ", level.path)
	get_tree().change_scene_to_file(level.path)


func create_level_button(level: Level):
	print("CREATING BUTTON FOR '{0}'".format([level.path]))
	#var button := Button.new()
	var button := LevelButtonScene.instantiate()
	button.title = level.title
	button.preview = level.preview
	button.pressed.connect(load_level.bind(level))
	level_list.add_child(button)
	print("button added to scene tree")
