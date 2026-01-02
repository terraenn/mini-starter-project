@tool
class_name SettingOptionCheckbox extends SettingOption

@onready var check_box: CheckBox = %CheckBox

func _ready() -> void:
	super()
	check_box.toggled.connect(_on_value_set)

func set_value(val : Variant) -> void:
	check_box.button_pressed = val
