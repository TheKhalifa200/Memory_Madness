extends Control

const MEMORY_TILE = preload("uid://cql5xay1b52lu")
@onready var grid_container: GridContainer = $HB/GridContainer
#var new_animal: Animal = ANIMAL.instantiate()
	#new_animal.position = start.position
	#call_deferred("add_child", new_animal)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected) # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_level_selected(level_setting: LevelSettings)-> void:
	grid_container.columns=level_setting.cols
	print("grid container columns: ",grid_container.columns)
	for i in level_setting.total_tiles:
		var new_tile: MemoryTile = MEMORY_TILE.instantiate()
		if i>=0:
				print("row: ",i)
				grid_container.add_child(new_tile)
	print("game:", level_setting)


func _on_exit_pressed() -> void:
	for i in grid_container.get_children():
		i.queue_free()
		SignalHub.emit_on_game_exit_pressed() # Replace with function body.
