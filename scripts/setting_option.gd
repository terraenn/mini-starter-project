@tool
@abstract
class_name SettingOption extends Control

#region CONSTANTS
#enum Type {
	#SLIDER,
	#CHECKBOX,
	#NONE,
#}
#endregion

#region VARIABLES
var settings_ui : SettingsUI:
	set(value):
		settings_ui = value
		set_value(settings_ui.get_value(internal_name))
#@export var type : Type = Type.NONE
## How it's called in-game. [code]internal_name.capitalize()[/code] by default
@export var display_name : String = "":
	set(value):
		display_name = value
		if setting_name:
			setting_name.text = value
@export var internal_name : String:
	set(value):
		if not display_name or display_name == internal_name.capitalize():
			display_name = value.capitalize()
		internal_name = value
@export var def_value : Variant
@onready var setting_name: Label = %Name

@warning_ignore("unused_signal")
signal value_set(setting : String, value : Variant)
#endregion

#region BUILT-IN
func _ready() -> void:
	setting_name.text = display_name
	#set_value(settings_ui.get_value(internal_name))
#endregion

#region CLASS
func _on_value_set(val : Variant) -> void:
	value_set.emit(internal_name, val)

@abstract
func set_value(val : Variant) -> void
#endregion
