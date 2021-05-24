class_name base_loader
extends Node


onready var p:Node2D = get_parent()


func _load(var path:String):
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file: String = dir.get_next()
		if file == '':
			break
		elif _is_valid(file):
			var result = str(ProjectSettings.load_resource_pack(path + file))
			p.debug_log('  loaded: %s %s' % [file, result])
	dir.list_dir_end()


func _is_valid(var file:String) -> bool:
	return \
		not file.begins_with('.')
