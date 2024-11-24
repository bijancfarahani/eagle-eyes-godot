extends Node

const win_phrase = "eagleeyes"
var _game_deck: EagleEyesLib.GameDeck = EagleEyesLib.GameDeck.new(win_phrase)
var _target_letter_index: int = 0
var title_scene = preload("res://Title.tscn")
var memorize_scene = preload("res://Memorization.tscn")
var spelling_scene = preload("res://Spelling.tscn")
var win_scene = preload("res://Win.tscn")
var lose_scene = preload("res://Lose.tscn")
func changeScene(scene: EagleEyesLib.GameState):
	match scene:
		EagleEyesLib.GameState.Not_Started:
			get_tree().change_scene_to_packed(title_scene)
		EagleEyesLib.GameState.Memorizing:
			get_tree().change_scene_to_packed(memorize_scene)
		EagleEyesLib.GameState.Spelling:
			get_tree().change_scene_to_packed(spelling_scene)
		EagleEyesLib.GameState.Win:
			get_tree().change_scene_to_packed(win_scene)
		EagleEyesLib.GameState.Lose:
			get_tree().change_scene_to_packed(lose_scene)									
		_:
			print("Unexpected game state!")

func handle_card_selection(card_id: int):
	for card in _game_deck._cards:
		if card._card_id != card_id:
			continue
		
		# The player selected the wrong letter and lost the game.
		if card._letter != win_phrase[_target_letter_index]:
			changeScene(EagleEyesLib.GameState.Lose)
		else:
			# The player selected the right letter, so increment the target
			# to the next letter.
			_target_letter_index += 1
			# The player selected the last letter, winning the game.
			if _target_letter_index == len(win_phrase):
				changeScene(EagleEyesLib.GameState.Win)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
