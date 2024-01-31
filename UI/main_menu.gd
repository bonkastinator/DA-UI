extends Control

var user_prefs: UserPreferences


# Called when the node enters the scene tree for the first time.
func _ready():
	_set_volumes_from_user_preference()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _set_volumes_from_user_preference():
	user_prefs = UserPreferences.load_or_create()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(user_prefs.master_audio_level))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(user_prefs.music_audio_level))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Voice"), linear_to_db(user_prefs.voice_audio_level))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(user_prefs.sfx_audio_level))

func _on_play_button_mouse_entered():
	$ButtonHoverSound.play()


func _on_options_button_mouse_entered():
	$ButtonHoverSound.play()


func _on_quit_button_mouse_entered():
	$ButtonHoverSound.play()


func _on_credits_button_mouse_entered():
	$ButtonHoverSound.play()


func _on_how_to_button_mouse_entered():
	$ButtonHoverSound.play()


func _on_play_button_pressed():
	$ButtonClickSound.play()
	#get_tree().change_scene_to_file()


func _on_options_button_pressed():
	$ButtonClickSound.play()
	get_tree().change_scene_to_file("res://UI/options_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()

func _on_credits_button_pressed():
	$ButtonClickSound.play()
	get_tree().change_scene_to_file("res://UI/credits_menu.tscn")

func _on_how_to_button_pressed():
	$ButtonClickSound.play()
	#get_tree().change_scene_to_file("res://UI/how_to_menu.tscn")

