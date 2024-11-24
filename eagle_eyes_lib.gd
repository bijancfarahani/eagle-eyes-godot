class_name EagleEyesLib

class GameCard:
	var _letter: String = ""
	var _card_id: int = 0
	var _is_visible: bool = false
	
	func _init(letter: String, card_id: int):
		_letter = letter
		_card_id = card_id
	
class GameDeck:
	var _cards: Array[GameCard] = []
	
	func _init(win_phrase: String):
		for letter_index in range(len(win_phrase)):
			_cards.append(GameCard.new(win_phrase[letter_index], letter_index))
		_cards.shuffle()

enum GameState
{
	Not_Started,
	Memorizing,
	Spelling,
	Win,
	Lose
}
