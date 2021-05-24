class_name _base_scene
extends Node2D


signal load_scene(scene)
signal change_menu(menu)


onready var _debug_text:RichTextLabel =  $_canvas/_debug_text


var active_menu:CanvasLayer = null
var params:Dictionary = {}


func _init_params():
	return


func _load_resource(var resource_path:String) -> Resource:
	debug_log('  load resource "%s" requested' % resource_path)
	var resource:Resource = ResourceLoader.load(resource_path)
	debug_log('    loaded %s' % str(resource != null))
	return resource


func _load_menus_of(var scene:String):
	debug_log('load menus of "%s" requested' % scene)
	var dir = Directory.new()
	var path: String = 'res://scenes/%s/menus/' % scene
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file: String = dir.get_next()
		if file == '':
			break
		elif _is_valid_file(file):
			var resource = _load_resource(path+file)
			if resource == null:
				continue
			var instance = resource.instance()
			self.add_child(instance)
			instance.get_node('control').hide()
	dir.list_dir_end()


func _is_valid_file(var file:String) -> bool:
	return \
		not file.begins_with('.') \
		and file.ends_with('.tscn')


func _load_scene(var scene_name:String, var params:Dictionary={}) -> bool:
	debug_log("load scene to %s requested" % scene_name)
	var scene = load("res://_scenes/%s/%s.tscn" % [scene_name, scene_name])
	if scene == null:
		debug_log("  couldn't load %s." % scene_name)
		return false
	else:
		var instance = scene.instance()
		if not params.empty():
			instance.params = params
			debug_log("  params injected.")
		
		get_tree().get_root().add_child(instance)
		queue_free()
		
		debug_log("  done.")
		return true


func _change_menu(var menu:String) -> bool:
	debug_log("change menu to %s requested" % menu)
	var node = get_node(menu)
	if node == null:
		debug_log("  couldn't find menu with name: %s" % menu)
		return false
	else:
		if active_menu != null:
			active_menu.get_node('control').hide()
		node.get_node('control').show()
		active_menu = node
		debug_log("  True")
		return true


func debug_log(msg:String) -> void:
	_debug_text.text += '%s%s' % [msg, '\n'] # msg + '\n'
