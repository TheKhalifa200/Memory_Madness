extends PanelContainer
@onready var moves_label: Label = $VBoxContainer/MovesLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_game_over.connect(total_moves)
	SignalHub.on_game_exit_pressed.connect(on_game_exit_pressed) # Replace with function body.

func total_moves(_moves_made:int)->void:
	show()
	moves_label.text="You took %d moves, well done!" % _moves_made
	
func on_game_exit_pressed()->void:
	hide()
