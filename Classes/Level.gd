# Objects of type "RefCounted" are automatically freed from memory when no references to this object
# are currently held.
extends RefCounted
class_name Level

var id: int
var chapter_id: int
var title: String
var path: String
var preview: Texture2D

func _init(id: int = 0, chapter_id: int = 0, title: String = "", path: String = "", preview: Texture2D = null):
	self.id = id
	self.chapter_id = chapter_id
	self.title = title
	self.path = path
	self.preview = preview
