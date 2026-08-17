extends Node3D

@onready var temp_mp_menu: PanelContainer = $"Mutliplayer temp menu/tempMPMenu"
@onready var adress_entry: LineEdit = $"Mutliplayer temp menu/tempMPMenu/VBoxContainer/AdressEntry"

const tempPlayerScene = preload("res://scenes/player.tscn")
const PORT = 9999 #lol
var enet_peer = ENetMultiplayerPeer.new() #erstellt ein multiplayer peer element und gibt einen zeiger drauf bevor es ohne die var in den abyss verschwindet

const NORAY_HOST = "tomfol.io"
const NORAY_PORT = 8890


func _ready() -> void:
	await Noray.connect_to_host(NORAY_HOST, NORAY_PORT) # await heist "warte hier und geh erst weider wenn das nach dir fertig ist"
	print ("yay mit noray relay verbunden :D")




func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		add_player(multiplayer.get_unique_id()) #das unique id ding generiert dann eben diese peeer id und packt sie dann direkt mit rein, weil wir ja unten gesgat haben wir wollen die peer id haben könnte man das glaube ich nicht einfach so dahinschreiben


func _on_host_pressed() -> void:
	temp_mp_menu.hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	#OLD NETWORKING CODE
	#enet_peer.create_server(PORT) # erstellt einen ENet-Server auf diesem Port. host client modell hier
	#multiplayer.multiplayer_peer = enet_peer
	#add_player(multiplayer.get_unique_id())
	#multiplayer.peer_connected.connect(add_player) #wenn sich jemand connected soll der einen player kriegenssss
	#multiplayer.peer_disconnected.connect(remove_player) #wir connecten das zur funktion remove player
	await Noray.register_host() #register as host (still we have time so we await)  "Hey Noray, ich bin der Host" → kriegst OID
	print("MY OID: ", Noray.oid) #print the OID (the ID that the user can paste into the line edit to join Noray.oid contains the oid
	
	await Noray.register_remote() #"Und falls jemand mit meiner OID joinen will, schick ihm diesen Port"
	print("MY OWN PORT: ", Noray.local_port) #und dies in die konsole auspucken
	
	enet_peer.create_server(Noray.local_port) #noray will sich lieber selber einen port aussuchen wir müssen das da reinpassen, weil er brauch die information einfach er kann sie sich nicht selber holen also stecken wir sie ihm ins maul zwischen den klammern
	multiplayer.multiplayer_peer = enet_peer #"Godot, benutze dieses Telefon für alles was Multiplayer ist" (oben ja festgelegt
	
	Noray.on_connect_nat.connect(nat_connect) # "Noray, wenn jemand per direkter Verbindung kommt, ruf _jemand_kommt_direkt auf"
	Noray.on_connect_relay.connect(relay_connect) # "Noray, wenn jemand per Relay kommt, ruf _jemand_kommt_per_relay auf"
	
	add_player(multiplayer.get_unique_id())
	multiplayer.peer_connected.connect(add_player) #ich sags nochmal multiplayer.peer_connected ist nur ein signal (hier halt in code) und wenn das abefeuert connecten wir mit .connect halt 'add_player'
	multiplayer.peer_disconnected.connect(remove_player)
	
	
	

func _on_join_pressed() -> void:
	temp_mp_menu.hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	await Noray.register_remote() #ich sags nochmal await macht das wir so lange bei der funktion bleiben bis wir eine bestätigung haben das sie durch ist
	
	Noray.on_connect_nat.connect(join) #probiert zuerst nat weil wenn geht besser weil wir keinen umweg haben wenn nicht dann isses so und dann müsssen wir relay hallo sagen
	Noray.on_connect_relay.connect(join)
	
	var host_oid = adress_entry.text
	await Noray.connect_nat(host_oid)
	
	
	
	#enet_peer.create_client("localhost", PORT) #das ist erstmal die ip whohin wir uns verbinden sollen, wir sind hier local also ist das fine
	#multiplayer.multiplayer_peer = enet_peer

func join(address: String, port: int) -> void: #ich nehme an das wir hier weil da einfach code anfällig ist für nochmal genau spezifizieren was das überhaupt für ein filetpy eist mit dem adress und port mit string und int
	enet_peer.create_client(address, port, 0, 0, 0, Noray.local_port)
	multiplayer.multiplayer_peer = enet_peer



func nat_connect(address: String, port: int) -> void:
	await PacketHandshake.over_enet_peer(enet_peer, address, port)
	#Handshake heist das wir einfach sicher stellen das hier bei NAT punchtrhough wirklich sicherstellen das beide router offen sind indem wir uns beide diese sachen austauschen,  und das in der klammer ist die adresse wohin wir das schicken sollen. Handshae ist automatisch da muss man nichts machen.
	print("Jemand kommt per NAT (direkt): ", address, ":", port)
	

func relay_connect(address: String, port: int) -> void:
	await PacketHandshake.over_enet_peer(enet_peer, address, port)
	# Gleich wie direkt, nur läuft's durch Noray's Server (automatisch)
	print("Jemand kommt per Relay (durch Noray): ", address, ":", port)

func add_player(peer_id): #soll ne peer id mitnehmen, peer id brauch man zum einen für authority purposes
	var player = tempPlayerScene.instantiate()
	player.name = str(peer_id)
	add_child(player) #verwirrend weil der var name hier temp player ist aber mit dem instanciaten laden wir das rein und die player node heist ja an sich player und das ist das was wir dareinpassenmüssen


func remove_player(peer_id):
	var player = get_node_or_null(str(peer_id))
	if player:
		player.queue_free() #NICHT VERGESSEN
