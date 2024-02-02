class_name UserPreferences extends Resource

@export_range(0, 1, 0.01) var master_audio_level : float = 0.5
@export_range(0, 1, 0.01) var music_audio_level : float = 0.5
@export_range(0, 1, 0.01) var voice_audio_level : float = 0.5
@export_range(0, 1, 0.01) var sfx_audio_level : float = 0.5

@export var action_events : Dictionary = {}

@export var user_name : String = ""

func save() -> void:
	ResourceSaver.save(self, "user://user_prefs.tres")
	

static func load_or_create() -> UserPreferences:
	var res : UserPreferences = load("user://user_prefs.tres") as UserPreferences
	if !res:
		res = UserPreferences.new()
	return res
	
