extends Control

const MEMORY_TILE = preload("uid://cql5xay1b52lu")
@onready var grid_container: GridContainer = $HB/GridContainer
@onready var scorer: Scorer = $Scorer
@onready var pairs_label: Label = $HB/VB/HB2/PairsLabel
@onready var moves_label: Label = $HB/VB/HB/MovesLabel

#var new_animal: Animal = ANIMAL.instantiate()
	#new_animal.position = start.position
	#call_deferred("add_child", new_animal)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected) # Replace with function body.
	

func _process(_delta: float) -> void:
	pairs_label.text = scorer.get_pairs_str()
	moves_label.text= scorer.get_moves_str()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_level_selected(level_setting: LevelSettings)-> void:
	
	var lds: LevelDataSelector = LevelDataSelector.new()
	var selected_images: Array[Texture2D] = lds.get_images_for_level(level_setting)
	var frame_image:Texture2D=ImageManager.get_random_frame_image()
	
	grid_container.columns=level_setting.cols
	#print("grid container columns: ",grid_container.columns)
	for image in selected_images:
		var new_tile: MemoryTile = MEMORY_TILE.instantiate()
		grid_container.add_child(new_tile)
		new_tile.setup(image, frame_image)
	#print("game:", level_setting)
	scorer.clear_new_game(level_setting.target_pairs)


func _on_exit_pressed() -> void:
	for i in grid_container.get_children():
		i.queue_free()
		SignalHub.emit_on_game_exit_pressed() # Replace with function body.
