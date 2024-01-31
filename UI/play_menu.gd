extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_return_button_mouse_entered():
	$ButtonHoverSound.play()

func _on_return_button_pressed():
	$ButtonClickSound.play()
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")

func _on_local_session_button_mouse_entered():
	$ButtonHoverSound.play()

func _on_host_session_button_mouse_entered():
	$ButtonHoverSound.play()

func _on_join_session_button_mouse_entered():
	$ButtonHoverSound.play()
	
# --------------------------------------------------------------------

func _on_local_session_button_pressed():
	$ButtonClickSound.play()
	# join local lobby  
	# join test lobby ui
	get_tree().change_scene_to_file("res://UI/lobby_menu.tscn")

func _on_host_session_button_pressed():
	$ButtonClickSound.play()
	# create online lobby (get key)

func _on_join_session_button_pressed():
	$ButtonClickSound.play()
	# join online lobby screen (use key for private lobby, leave blank for public lobby) 






