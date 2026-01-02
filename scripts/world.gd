class_name World extends Node2D

#region VARIABLES, SIGNALS AND CONST
@onready var test: Sprite2D = %Test
#endregion

#region BUILT-IN
func _enter_tree() -> void:
	Global.world = self

func _process(delta: float) -> void:
	test.rotation += delta
#endregion

#region CLASS
#endregion
