extends _base_scene


func _ready():
	debug_log('game scene loaded.')
	
	_load_menus_of('game_scene')
	_change_menu('game_menu')
