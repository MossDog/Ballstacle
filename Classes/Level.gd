# Objects of type "RefCounted" are automatically freed from memory when no references to this object
# are currently held.
extends RefCounted
class_name Level

var chapter_id: int
var id: int
var title: String
var path: String
var preview: Texture2D

func _init(lvl_id: int = 0, lvl_chptr_id: int = 0, lvl_title: String = "", lvl_path: String = "", lvl_preview: Texture2D = null):
	self.chapter_id = lvl_chptr_id
	self.id = lvl_id
	self.title = lvl_title
	self.path = lvl_path
	self.preview = lvl_preview
