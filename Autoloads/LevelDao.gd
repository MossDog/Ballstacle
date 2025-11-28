extends Node
class_name LevelDao

var levels: Array[Level]
const LEVEL_DIR = "res://Scenes/Levels"

func load_levels():
	var dir := DirAccess.open(LEVEL_DIR)
	for file_name in dir.get_files():
		if file_name.begins_with("Level"):
			var id = get_id_from_path(file_name)
			var chapter_id = 0 # PLACEHOLDER
			var title = "" # PLACEHOLDER
			var path = LEVEL_DIR + file_name
			levels.append(Level.new(id, chapter_id, title, path, null))
				
func get_id_from_path(path: String) -> int:
	var regex := RegEx.new()
	regex.compile("\\d+")
	var id = int(regex.search(path).get_string())
	return id
