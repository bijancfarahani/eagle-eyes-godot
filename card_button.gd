extends TextureButton
class_name CardButton

var letter_image: Resource
var _card_id: int = 0
static var blank_letter = preload("res://assets/letters/blank.png")

func _init(image: Resource, card_id: int) -> void:
	_card_id = card_id
	letter_image = image
	#self.texture_normal = image
	self.texture_normal = blank_letter

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)
	add_child(self)

func _button_pressed():
	# The player already flipped over this card.
	if Main._game_deck._cards[_card_id]._is_visible:
		return
	# Flip over this card to reveal the letter.
	self.texture_normal = letter_image
	Main.handle_card_selection(_card_id)
