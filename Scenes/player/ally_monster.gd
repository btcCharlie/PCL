class_name AllyMonster
extends Node2D

@export var stats: Stats : set = set_character_stats

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var stats_ui: StatsUI = $StatsUI as StatsUI

var implements := [I.Damageable]


func _ready() -> void:
	await get_tree().create_timer(4).timeout
	take_damage(8)
	

func set_character_stats(value: Stats) -> void:
	stats = value.create_instance()
	print(stats)
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)

	update_ally()


func update_ally() -> void:
	if not stats is Stats:
		return
	if not is_inside_tree():
		await ready
		
	sprite_2d.texture = stats.ally_icon
	update_stats()
		

func update_stats() -> void:
	stats_ui.update_stats(stats)


func take_damage(damage: int) -> void:
	if stats.health <= 0:
		return
	stats.take_damage(damage)
	
	if stats.health <= 0:
		queue_free()
