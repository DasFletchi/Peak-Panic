extends Node2D


@onready var _2_nd_screen_multiplayer: Node2D = $"2nd Screen Multiplayer"
@onready var _1_st_container: VBoxContainer = $"1st Container"


func _on_singleplayer_button_pressed() -> void:
	print("temp singleplayer button")
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_multiplayer_button_pressed() -> void:
	print("multiplayer button pressed")
	_2_nd_screen_multiplayer.show()
	_1_st_container.hide()
	get_tree().change_scene_to_file("res://scenes/testMain.tscn")
