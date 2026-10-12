extends Control

@onready var game: Control = $Game
@onready var main: Control = $Main

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.on_game_exit_pressed.connect(on_game_exit_pressed)

func on_game_exit_pressed()->void:
	show_game(false)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_level_selected(_level_setting: LevelSettings)-> void:
	show_game(true)

func show_game(ShowGame:bool)->void:
	main.visible = !ShowGame
	game.visible = ShowGame
