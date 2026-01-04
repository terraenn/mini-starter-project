class_name SettingsUI extends Control

#region VARIABLES
@onready var settings_options: VBoxContainer = %SettingsOptions
@onready var blur: BlurRect = %Blur
@onready var close: Button = %Close
@onready var close_pulser: Pulser = %ClosePulser
#endregion

#region BUILT-IN
func _ready() -> void:
	close.pressed.connect(disappear)
	close.pivot_offset = close.size / 2
	#close.pressed.connect(close_pulser.set.bind("pulse_", true))
	#close.button_up.connect(close_pulser.set.bind("pulse_", false))
	for i : Node in settings_options.get_children():
		if i is SettingOption:
			i.settings_ui = self
			i.value_set.connect(_on_setting_set)
#endregion

#region CLASS
func _on_setting_set(setting : StringName, value : Variant) -> void:
	match setting:
		"music":
			Global.music_volume = value
		"sfx":
			Global.sfx_volume = value
		"screenshake":
			Global.screenshake = value

func get_value(setting : StringName) -> Variant:
	match setting:
		"music":
			return Global.music_volume
		"sfx":
			return Global.sfx_volume
		"screenshake":
			return Global.screenshake
		"_":
			push_error("Setting '%s' not found." % setting)
	return

## Grow to scale Vector2.ONE
func appear() -> void:
	pivot_offset = size / 2
	#scale = Vector2.ZERO
	scale = Vector2.DOWN
	blur.blur = 2.5
	var tween := create_tween()
	#tween.tween_property(self, "scale", Vector2.ONE, 0.3).set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "scale:x", 1, 0.45).set_trans(Tween.TRANS_QUINT)

## Shrink and free
func disappear(no_unpause : bool = false) -> void:
	if not no_unpause:
		Global.game.unpause()
	blur.blur = 0
	var tween := create_tween()
	tween.tween_property(self, "scale:x", 0, 0.3).set_trans(Tween.TRANS_QUINT)
	tween.tween_callback(queue_free)
#endregion
