extends _base_scene


func _ready():
	debug_log('menu scene loaded.')
	_load_menus_of('menu_scene')
	_change_menu('main_menu')
