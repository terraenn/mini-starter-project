@tool
class_name BBCodeLabel extends RichTextLabel

func _init() -> void:
	bbcode_enabled = true
	autowrap_mode = TextServer.AUTOWRAP_OFF
	fit_content = true
	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vertical_alignment = VERTICAL_ALIGNMENT_CENTER
