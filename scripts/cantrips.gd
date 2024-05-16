extends Node2D

func _ready():
	get_spell_text()

func _process(delta):
	pass
	

func get_spell_text():
	var file = "res://imports/srd_cantrips.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	var json_as_arr = json_as_dict.values()
	var spells_api_text = json_as_arr.pop_back()
	if spells_api_text:
		print(spells_api_text.length)
