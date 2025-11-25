extends Control


@onready var level_list: VBoxContainer = $LevelList

func _ready():
	load_levels()
	display_levels()

func display_levels():
	pass


func load_level(path: String):
	print("Loading Level: ", path)
	get_tree().change_scene_to_file(path)


func create_level_button(path: String):
	var button := Button.new()
	button.text = path.get_file().get_basename()  # e.g. "Level1"
	button.pressed.connect(load_level.bind(path))
	print("Path bound to button", path)
	level_list.add_child(button)
	print("button added to scene tree")


func load_levels():
	var dir := DirAccess.open("res://Scenes/Levels")
	if dir:
		for file_name in dir.get_files():
			if file_name.begins_with("Level") and file_name.ends_with(".tscn"):
				var path = "res://Scenes/Levels/" + file_name
				create_level_button(path)
