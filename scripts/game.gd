class_name Game extends Node

#region VARIABLES, SIGNALS AND CONST
@onready var ui: Control = %UI
#endregion

#region BUILT-IN
func _enter_tree() -> void:
	Global.game = self

func _ready() -> void:
	Global.ui = ui
#endregion

#region CLASS
## Pause the World scene
func pause() -> void:
	get_tree().paused = true

## Unpause the World scene
func unpause() -> void:
	get_tree().paused = false

func set_music_volume_linear(value : float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value)

func set_sfx_volume_linear(value : float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)
#endregion
