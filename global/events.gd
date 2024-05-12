extends Node

# Move-related events
signal move_drag_started(card_ui: CardUI)
signal move_drag_ended(card_ui: CardUI)
signal move_aim_started(card_ui: CardUI)
signal move_aim_ended(card_ui: CardUI)
signal move_played(move: Move)

