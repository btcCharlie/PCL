class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)

const BASE_STYLEBOX := preload("res://scenes/card_ui/move_card_base_stylebox.tres")
const DRAGGING_STYLEBOX := preload("res://scenes/card_ui/move_card_dragging_stylebox.tres")
const HOVER_STYLEBOX := preload("res://scenes/card_ui/move_card_hover_stylebox.tres")

@export var move: Move : set = _set_move
@export var stats: Stats : set = _set_stats

@onready var panel: Panel = %Panel
@onready var title: Label = %Title
@onready var icon: TextureRect = %Icon
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine
@onready var targets: Array[Node] = []

var parent: Control
var tween: Tween
var playable := true : set = _set_playable
var disabled := false


func _ready() -> void:
	Events.move_aim_started.connect(_on_card_drag_or_aiming_started)
	Events.move_drag_started.connect(_on_card_drag_or_aiming_started)
	Events.move_aim_ended.connect(_on_card_drag_or_aiming_ended)
	Events.move_drag_ended.connect(_on_card_drag_or_aiming_ended)
	card_state_machine.init(self)


func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)


func animate_to_position(new_position: Vector2, duration: float) -> void:
	tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", new_position, duration)


func play() -> void:
	if not move:
		return
	
	move.play(targets, stats)
	queue_free()


func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)


func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()


func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()


func _set_move(value: Move) -> void:
	if not is_node_ready():
		await ready
	
	move = value
	title.text = str(move.name)
	icon.texture = move.icon


func _set_playable(value: bool) -> void:
	playable = value


func _set_stats(value: Stats) -> void:
	stats = value
	stats.stats_changed.connect(_on_stats_changed)


func _on_drop_point_detector_area_entered(area) -> void:
	if not targets.has(area):
		targets.append(area)


func _on_drop_point_detector_area_exited(area) -> void:
	targets.erase(area)


func _on_card_drag_or_aiming_started(used_card: CardUI) -> void:
	if used_card == self:
		return
	
	disabled = true
	
	
func _on_card_drag_or_aiming_ended(_card: CardUI) -> void:
	disabled = false
	
	
func _on_stats_changed():
	pass
