# Global
extends Node

#region NODES
## World and UI canvas layer root
var game : Game
## 2D world root
var world : World
## Container for UI elements
var ui : Control
#endregion
## Whether the world is paused
var paused : bool = false

#region SETTINGS
var sfx_volume : float = 50:
	set(value):
		sfx_volume = value
		game.set_sfx_volume_linear(value / 20)
var music_volume : float = 50:
	set(value):
		music_volume = value
		game.set_music_volume_linear(value / 20)
var screenshake : bool = true
#endregion
