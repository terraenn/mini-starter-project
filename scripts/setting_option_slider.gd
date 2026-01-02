@tool
class_name SettingOptionSlider extends SettingOption

@onready var slider: HSlider = %HSlider

func _ready() -> void:
	super()
	slider.value_changed.connect(_on_value_set)
	slider.value = (def_value as float) if def_value else slider.value

func set_value(val : Variant) -> void:
	slider.value = val
