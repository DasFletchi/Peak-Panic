extends Node3D

@onready var temp_mp_menu: PanelContainer = $"Mutliplayer temp menu/tempMPMenu"
@onready var adress_entry: LineEdit = $"Mutliplayer temp menu/tempMPMenu/VBoxContainer/AdressEntry"

#oh frick jetzt kommt die erste network scheisse
const tempPlayerScene = preload("res://scenes/player.tscn")
const PORT = 9999 #lol
var enet_peer = ENetMultiplayerPeer.new() #erstellt ein multiplayer peer element und gibt einen zeiger drauf bevor es ohne die var in den abyss verschwindet


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		add_player(multiplayer.get_unique_id()) #das unique id ding generiert dann eben diese peeer id und packt sie dann direkt mit rein, weil wir ja unten gesgat haben wir wollen die peer id haben könnte man das glaube ich nicht einfach so dahinschreiben


func _on_host_pressed() -> void:
	temp_mp_menu.hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	enet_peer.create_server(PORT) # erstellt einen ENet-Server auf diesem Port. host client modell hier
	multiplayer.multiplayer_peer = enet_peer


func _on_join_pressed() -> void:
	pass

func add_player(peer_id): #soll ne peer id mitnehmen, peer id brauch man zum einen für authority purposes
	var player = tempPlayerScene.instantiate()
	player.name = str(peer_id)
	add_child(player) #verwirrend weil der var name hier temp player ist aber mit dem instanciaten laden wir das rein und die player node heist ja an sich player und das ist das was wir dareinpassenmüssen
