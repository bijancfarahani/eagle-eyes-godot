extends HBoxContainer
var a_letter = preload("res://assets/letters/a.png")
var e_letter = preload("res://assets/letters/e.png")
var g_letter = preload("res://assets/letters/g.png")
var l_letter = preload("res://assets/letters/l.png")
var s_letter = preload("res://assets/letters/s.png")
var y_letter = preload("res://assets/letters/y.png")
var blank_letter = preload("res://assets/letters/blank.png")
var images = {
	'a': preload("res://assets/letters/a.png"),
	'e': preload("res://assets/letters/e.png"),
	'g': preload("res://assets/letters/g.png"),
	'l': preload("res://assets/letters/l.png"),
	's': preload("res://assets/letters/s.png"),
	'y': preload("res://assets/letters/y.png"),
	'blank': preload("res://assets/letters/blank.png")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for card in Main._game_deck._cards:		
		var card_button = CardButton.new(images[card._letter], card._card_id)
		add_child(card_button)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
