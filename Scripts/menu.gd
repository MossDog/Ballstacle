extends Control

const LEVEL_SELECT_PATH : String = "res://Scenes/LevelSelect.tscn"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Menu is ready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("Menu is processing")
	pass


func _on_play_button_pressed() -> void:
	print("Play Button Pressed")
	get_tree().change_scene_to_file(LEVEL_SELECT_PATH)


func _on_settings_button_pressed() -> void:
	print("Settings Button Pressed")


func _on_quit_button_pressed() -> void:
	print("Quit Button Pressed")
	get_tree().quit()
