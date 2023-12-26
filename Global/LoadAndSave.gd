extends Node


const SAVE_PATH = "user://savegame.bin"


func saveGame():
	var file = FileAccess.open(SAVE_PATH,FileAccess.WRITE)
	var data : Dictionary = {
		"xposition" : Global.Account['xposition'],
		"yposition" : Global.Account['yposition'],
		"kills" : Global.Account['kills'],
		"time" : Global.Account['time'],
		"storage" : Global.storage,
		"clothing" : Global.Account['clothing'],
		"accessory" : Global.Account['accessory'],
		"cat" : Global.Account['cat']
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH,FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Global.Account['xposition'] = current_line["xposition"]
				Global.Account['yposition'] = current_line["yposition"]
				Global.Account['kills'] = current_line["kills"]
				Global.Account['time'] = current_line["time"]
				Global.Account['clothing'] = current_line["clothing"]
				Global.Account['accessory'] = current_line["accessory"]
				Global.Account['cat'] = current_line["cat"]
				Global.storage = current_line["storage"]
