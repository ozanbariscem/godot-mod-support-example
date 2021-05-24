extends _base_scene


onready var game_loader:= $game_loader
onready var mod_loader:= $mod_loader


var wait_for_input_to_continue:bool = true


func _ready():
	debug_log('main scene loaded.')
	game_loader.load_game()
	mod_loader.load_mods()

	if not wait_for_input_to_continue:
		_load_scene('_menu_scene')


func _input(event):
	if event.is_pressed():
		_load_scene('_menu_scene')
