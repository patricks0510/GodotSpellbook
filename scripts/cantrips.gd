extends Node2D

@onready var displaySpell = [$SpellDisplay,$SpellDisplay2,$SpellDisplay3,
$SpellDisplay4]

@onready var spell_list_api = parse_spell_json()

@export var firstSpell = 0
@export var lastSpell = firstSpell + 4

func _ready():
	get_spell_text(spell_list_api)

func _process(delta):
	pass

func parse_spell_json():
	var file = "res://imports/srd_cantrips.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	var json_as_arr = json_as_dict.values()
	var spells_api_text = json_as_arr.pop_back()
	return spells_api_text

func get_spell_text(spells_api_text):
	for spell in range(0,4):
		var spellToDisplay = spell + firstSpell
		if(spellToDisplay>=spells_api_text.size()):
			firstSpell -= 4
			lastSpell -= 4
			break
		var displaySpell_children = displaySpell[spell].get_children()
		var spellName = spells_api_text[spellToDisplay].get("name")
		displaySpell_children[0].text = spellName
		var description = spells_api_text[spellToDisplay].get("desc")
		displaySpell_children[1].text = description
		var higherLevel = spells_api_text[spellToDisplay].get("higher_level")
		displaySpell_children[2].text = higherLevel
		var range = spells_api_text[spellToDisplay].get("range")
		displaySpell_children[3].text = range
		var components = spells_api_text[spellToDisplay].get("components")
		if components != null:
			displaySpell_children[4].text = components
		else:
			displaySpell_children[4].text = "N/A"
		var duration = spells_api_text[spellToDisplay].get("duration")
		displaySpell_children[5].text = duration
		var castTime = spells_api_text[spellToDisplay].get("casting_time")
		displaySpell_children[6].text = castTime
		var level = spells_api_text[spellToDisplay].get("level")
		displaySpell_children[7].text = level
		var school = spells_api_text[spellToDisplay].get("school")
		displaySpell_children[8].text = school
		var classSpellList = spells_api_text[spellToDisplay].get("dnd_class")
		displaySpell_children[9].text = classSpellList
		var pageNum = spells_api_text[spellToDisplay].get("page")
		displaySpell_children[10].text = pageNum
		var source = spells_api_text[spellToDisplay].get("document__title")
		displaySpell_children[11].text = source
	
	#spells_api_text = spells_api_text[1]
	#var spells_api_text_arr = spells_api_text.split("}, {",true)
	#if spells_api_text:
		#print(spells_api_text)


func _on_back_pressed():
	if(firstSpell == 0):
		get_tree().change_scene_to_file("res://scenes/front_page.tscn")
	else:
		firstSpell -= 4
		lastSpell -= 4
		get_spell_text(spell_list_api)


func _on_next_pressed():
	firstSpell += 4
	lastSpell += 4
	get_spell_text(spell_list_api)
