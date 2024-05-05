extends CardState


func enter() -> void:
	card_ui.color.color = Color.hex(0x6c71c4FF)
	card_ui.state.text = "RELEASED"
