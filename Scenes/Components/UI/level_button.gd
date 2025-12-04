extends Button
class_name LevelButton

@export var preview: Texture2D:
	set(value):
		preview = value
		var tex := $Control/TextureRect
		if tex:
			tex.texture = value

@export var title: String:
	set(value):
		title = value
		var label := $Control/Label
		if label:
			label.text = value
