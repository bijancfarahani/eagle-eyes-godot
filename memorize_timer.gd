extends Timer

const memorization_duration = 5.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.start(memorization_duration)

func _on_timeout() -> void:
	Main.changeScene(EagleEyesLib.GameState.Spelling)
