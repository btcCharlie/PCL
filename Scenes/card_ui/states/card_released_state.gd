extends CardState

var played: bool


func enter() -> void:
	card_ui.color.color = Color.hex(0x6c71c4FF)
	card_ui.state.text = "RELEASED"

	played = false
	
	if not card_ui.targets.is_empty():
		played = true
		print("play " + card_ui.name + "for target(s):", card_ui.targets)
	
	
func on_input(_event: InputEvent) -> void:
	if played:
		return
	
	transition_requested.emit(self, CardState.State.BASE)
