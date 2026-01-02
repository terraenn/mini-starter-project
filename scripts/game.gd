class_name Game extends Node

#region VARIABLES, SIGNALS AND CONST
var settings_scene : PackedScene = preload("uid://xxqir7ic260e")
var settings : SettingsUI
# Meant to be used to check if there's some kind of fullscreen UI open on the screen already
# Replace getter to make it useful
# Like settings, restart UI, etc.
var active_ui : bool = false:
	get:
		return true if settings else false
#endregion

#region BUILT-IN
func _enter_tree() -> void:
	Global.game = self

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("open_or_close_settings"):
		if settings:
			settings.disappear()
			unpause()
		else:
			settings = settings_scene.instantiate()
			Global.ui.add_child(settings)
			settings.appear()
			pause()
#endregion

#region CLASS
## Pause the game
func pause() -> void:
	SignalBus.paused.emit()
	Global.paused = true
	get_tree().paused = true

## Unpause the game
func unpause() -> void:
	SignalBus.unpaused.emit()
	Global.paused = false
	get_tree().paused = false

func set_music_volume_linear(value : float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"), value)

func set_sfx_volume_linear(value : float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)
#endregion
