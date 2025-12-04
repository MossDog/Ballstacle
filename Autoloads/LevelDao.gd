extends Node

var levels: Array[Level]
const LEVEL_SCENES_DIR = "res://Scenes/Levels/"
const LEVEL_THUMB_DIR = "res://Images/Level_Thumbnails/"

func _ready() -> void:
	load_levels()

func load_thumbnail(chapter_id, id) -> Texture2D:
	var dir := DirAccess.open(LEVEL_THUMB_DIR)
	for file_name in dir.get_files():
		var data = file_name.split("_")
		if int(data[1]) == chapter_id and int(data[2]) == id:
			var thumb_texture: Texture2D = load(LEVEL_THUMB_DIR + file_name)
			return thumb_texture
	return null

func load_levels():
	var dir := DirAccess.open(LEVEL_SCENES_DIR)
	for file_name in dir.get_files():
		if file_name.begins_with("Level"):
			print("FILE NAME ", file_name)
			var data = file_name.split("_")
			print(data)
			var chapter_id = int(data[1])
			var id = int(data[2].get_slice(".", 0))
			var title = data[3]
			var path = LEVEL_SCENES_DIR + file_name
			var thumbnail = load_thumbnail(chapter_id, id) # PLACEHOLDER
			levels.append(Level.new(chapter_id, id, title, path, thumbnail))
