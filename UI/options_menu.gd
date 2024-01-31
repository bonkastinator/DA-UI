extends Control

@onready var master_volume_slider = %MasterVolumeSlider
@onready var music_volume_slider = %MusicVolumeSlider
@onready var voice_volume_slider = %VoiceVolumeSlider
@onready var sfx_volume_slider = %SFXVolumeSlider

var user_prefs: UserPreferences

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_user_prefs()
	
	# Window Mode
	$Node/DisplayModeButtons.add_item("Window Mode", 0)
	$Node/DisplayModeButtons.add_item("Full-Screen", 1)


func _set_user_prefs():
	user_prefs = UserPreferences.load_or_create()
	if master_volume_slider:
		master_volume_slider.value = user_prefs.master_audio_level
	if music_volume_slider:
		music_volume_slider.value = user_prefs.music_audio_level
	if voice_volume_slider:
		voice_volume_slider.value = user_prefs.voice_audio_level
	if sfx_volume_slider:
		sfx_volume_slider.value = user_prefs.sfx_audio_level

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_return_button_mouse_entered():
	$ButtonHoverSound.play()


func _on_return_button_pressed():
	$ButtonClickSound.play()
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _on_display_mode_buttons_item_selected(index):
	var current_selected = index
	if current_selected == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		#DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
	if current_selected == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_master_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
	if user_prefs:
		user_prefs.master_audio_level = value
		user_prefs.save()

func _on_music_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))
	if user_prefs:
		user_prefs.music_audio_level = value
		user_prefs.save()

func _on_voice_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Voice"), linear_to_db(value))
	if user_prefs:
		user_prefs.voice_audio_level = value
		user_prefs.save()


func _on_sfx_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))
	if user_prefs:
		user_prefs.sfx_audio_level = value
		user_prefs.save()
