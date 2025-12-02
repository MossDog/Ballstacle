extends Node

var levels: Array[Level]
const LEVEL_DIR = "res://Scenes/Levels/"

func load_levels():
	var dir := DirAccess.open(LEVEL_DIR)
	for file_name in dir.get_files():
		if file_name.begins_with("Level"):
			print("FILE NAME ", file_name)
			var data = file_name.split("_")
			print(data)
			var id = int(data[2])
			var chapter_id = int(data[1])
			var title = data[3]
			var path = LEVEL_DIR + file_name
			levels.append(Level.new(id, chapter_id, title, path, null))
