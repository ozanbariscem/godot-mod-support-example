extends base_loader


func load_mods():
	p.debug_log('Loaded mods:')
	_load('mod/')


func _is_valid(var file:String) -> bool:
	return ._is_valid(file) and file != 'guard.txt' 
