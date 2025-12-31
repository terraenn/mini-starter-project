@tool
class_name SettingOptionSlider extends SettingOption

@onready var slider: HSlider = %HSlider
@export_tool_button("some_name") var callable : Callable = _ready
func _ready() -> void:
	#explode()
	#slider.value_changed.connect(
		#func(val : float) -> void:
			#value_set.emit(setting_name, val)
	#)
	focus_entered.connect(
		func some_lambda() -> void:
			pass
	)
