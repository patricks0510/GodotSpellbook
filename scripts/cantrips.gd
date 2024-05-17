extends Node2D

@onready var displaySpell = [$SpellDisplay,$SpellDisplay2,$SpellDisplay3,
$SpellDisplay4,$SpellDisplay5, $SpellDisplay6]

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
	
	for spell in range(0,6):
		var displaySpell_children = displaySpell[spell].get_children()
		var spellName = spells_api_text[spell].get("name")
		displaySpell_children[0].text = spellName
		var description = spells_api_text[spell].get("desc")
		displaySpell_children[1].text = description
		var higherLevel = spells_api_text[spell].get("higher_level")
		displaySpell_children[2].text = higherLevel
		var range = spells_api_text[spell].get("range")
		displaySpell_children[3].text = range
		var components = spells_api_text[spell].get("components")
		if components != null:
			displaySpell_children[4].text = components
		else:
			displaySpell_children[4].text = "N/A"
		var duration = spells_api_text[spell].get("duration")
		displaySpell_children[5].text = duration
		var castTime = spells_api_text[spell].get("casting_time")
		displaySpell_children[6].text = castTime
		var level = spells_api_text[spell].get("level")
		displaySpell_children[7].text = level
		var school = spells_api_text[spell].get("school")
		displaySpell_children[8].text = school
		var classSpellList = spells_api_text[spell].get("dnd_class")
		displaySpell_children[9].text = classSpellList
		var pageNum = spells_api_text[spell].get("page")
		displaySpell_children[10].text = pageNum
		var source = spells_api_text[spell].get("document__title")
		displaySpell_children[11].text = source
	
	#spells_api_text = spells_api_text[1]
	#var spells_api_text_arr = spells_api_text.split("}, {",true)
	#if spells_api_text:
		#print(spells_api_text)
