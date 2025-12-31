@tool
class_name SettingOption extends Control

#region CONSTANTS
#enum Type {
	#SLIDER,
	#CHECKBOX,
	#NONE,
#}
#endregion

#region VARIABLES
var settings_ui : SettingsUI
#@export var type : Type = Type.NONE
## How it's called in-game. [code]internal_name.capitalize()[/code] by default
@export var display_name : String = "":
	set(value):
		display_name = value
		setting_name.text = value
@export var internal_name : String:
	set(value):
		if not display_name or display_name == internal_name.capitalize():
			display_name = value.capitalize()
		internal_name = value
@export var def_value : Variant
@export var setting_name : Label

@warning_ignore("unused_signal")
signal value_set(setting : String, value : Variant)
#endregion

#region CLASS
func _on_value_set(val : Variant) -> void:
	value_set.emit(internal_name, val)
#endregion
