class_name Stats
extends Resource

signal stats_changed

@export var starting_move_set: MoveSet

@export_group("Stats")
@export var max_health := 1
@export var max_stress := 1
@export var base_attack := 1
@export var base_defense := 1
@export var base_speed := 1

@export_group("Icons")
@export var ally_icon: Texture
@export var foe_icon: Texture
@export var inventory_icon: Texture

var move_set: MoveSet
var health: int : set = set_health
var stress: int : set = set_stress
var attack: int
var defense: int
var speed: int

var implements = [I.Damageable]


func set_health(value : int) -> void:
	health = clampi(value, 0, max_health)
	stats_changed.emit()


func set_stress(value : int) -> void:
	stress = clampi(value, 0, max_stress)
	stats_changed.emit()


func take_damage(damage : int) -> void:
	if damage <= 0:
		return
	self.health -= damage
	self.stress += roundi(damage / 2.0)
	

func heal(amount : int) -> void:
	self.health += amount


func create_instance() -> Resource:
	var instance: Stats = self.duplicate()
	instance.health = max_health
	print(instance)
	instance.stress = 0
	print(instance)
	instance.move_set = starting_move_set.duplicate()
	print(instance)
	return instance


func _to_string() ->  String:
	var string_array: PackedStringArray = [
		"	Health %s/%s" % [health, max_health],
		"	Stress %s/%s" % [stress, max_stress],
		"	Attack %s (%s)" % [attack, base_attack],
		"	Defense %s (%s)" % [defense, base_defense],
		"	Speed %s (%s)" % [speed, base_speed]
	]
	var string = "\n".join(string_array)
	return "Stats:\n" + string
