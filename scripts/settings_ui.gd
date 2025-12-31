class_name SettingsUI extends Control

#region VARIABLES
@onready var settings_options: VBoxContainer = %SettingsOptions
#endregion

#region BUILT-IN
func _ready() -> void:
	for i : Node in settings_options.get_children():
		if i is SettingOption:
			i.value_set.connect(_on_setting_set)
#endregion

#region CLASS
func _on_setting_set(_setting : StringName, _value : Variant) -> void:
	pass # insert logic
#endregion
