extends Control


@onready var level_list: VBoxContainer = $LevelList

func _ready():
	LevelDao.load_levels()
	display_levels()

func display_levels():
	for level in LevelDao.get("levels"):
		create_level_button(level)

func load_level(level: Level):
	print("Loading Level: ", level.path)
	get_tree().change_scene_to_file(level.path)


func create_level_button(level: Level):
	print("CREATING BUTTON FOR '{0}'".format([level.path]))
	var button := Button.new()
	button.text = level.title
	button.pressed.connect(load_level.bind(level))
	level_list.add_child(button)
	print("button added to scene tree")
