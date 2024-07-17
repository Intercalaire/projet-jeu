extends Node

var config = ConfigFile.new()
const SETTINGS_FILE_PATH = "/nfs/homes/vgodart/.var/app/org.godotengine.Godot/data/godot/app_userdata/projet de jeu"

func _ready():
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		#setting touche
		config.set_value("keybinding", "move_left", "A")
		config.set_value("keybinding", "move_right", "D")
		config.set_value("keybinding", "move_up", "W")
		config.set_value("keybinding", "move_down", "S")
		config.set_value("keybinding", "shoot", "mouse_1")
		
		#setting video
		#config.set_value("video", "fullscreen", true)
		#config.set_value("video", "shoot", false)
		
		#setting audio
		#config.set_value("audio", "master_volume", 1.0)
		#config.set_value("audio", "sfx_volume", 1.0)
		
		config.save(SETTINGS_FILE_PATH)
	else:
		config.load(SETTINGS_FILE_PATH)

#func save_video_setting(key : String, value):
	#config.set_value("video", key, value)
	#config.save(SETTINGS_FILE_PATH)
#
#func load_video_settings():
	#var video_settings = {}
	#for key in config.get_section_keys("video"):
		#video_settings[key] = config.get_value("video", key)
	#return video_settings
#
#func save_audio_setting(key : String, value):
	#config.set_value("audio", key, value)
	#config.save(SETTINGS_FILE_PATH)
#
#func load_audio_settings():
	#var audio_settings = {}
	#for key in config.get_section_keys("audio"):
		#audio_settings[key] = config.get_value("audio", key)
	#return audio_settings
