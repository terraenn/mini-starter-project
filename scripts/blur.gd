@tool
class_name BlurRect extends ColorRect

#region VARIABLES
@export_range(0, 5, 0.1) var blur : float = 0:
	set(value):
		blur = value
		if animation_:
			set_blur_animated(value)
		else:
			set_blur_direct(value)
var shader : ShaderMaterial = material
# ANIMATION
@export_group("Animation", "animation_")
@export_custom(PROPERTY_HINT_GROUP_ENABLE, "") var animation_ : bool = false
@export var animation_trans : Tween.TransitionType = Tween.TRANS_LINEAR
@export var animation_ease : Tween.EaseType = Tween.EASE_IN_OUT
@export_range(0, 2, 0.1) var animation_min_duration : float = 0.5
@export_range(0, 4, 0.1) var animation_max_duration : float = 2.5
@export_range(0.1, 1, 0.1) var animation_speed_multi : float = 0.2
#endregion

#region CLASS
func set_blur_animated(val : float, anim_duration_override : float = 0) -> void:
	var tween := create_tween()
	var old_val : float = shader.get_shader_parameter("lod")
	var animation_duration : float =\
	 clampf(absf(val - old_val) * animation_speed_multi, animation_min_duration, animation_max_duration) if not anim_duration_override else anim_duration_override
	#var animation_duration : float = absf()
	tween.tween_method(
		func(arg : float) -> void:
			#print(arg)
			shader.set_shader_parameter("lod", arg),
			old_val, val, animation_duration
	).set_trans(animation_trans).set_ease(animation_ease)

func set_blur_direct(val : float) -> void:
	shader.set_shader_parameter("lod", val)
#endregion
