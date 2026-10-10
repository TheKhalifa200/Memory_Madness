extends TextureButton
@onready var label: Label = $Label

@export var level_setting:LevelSettings
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text=str(level_setting) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_pressed() -> void:
	SignalHub.emit_on_level_selected(level_setting)
