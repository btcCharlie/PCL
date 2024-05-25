class_name Move
extends Resource

enum Type {ATTACK, SKILL, POWER}
enum Target {SELF, ALLY, ALL_ALLIES, SINGLE_ENEMY, ALL_ENEMIES, EVERYONE}

@export_group("Move Attributes")
@export var id: String
@export var type: Type
@export var target: Target
@export var element: ElementalType

@export_group("Move Visuals")
@export var name: String
@export var icon: Texture
@export_multiline var tooltip_text: String


func is_single_targeted() -> bool:
	return target == Target.SINGLE_ENEMY
	

func _get_targets(targets: Array[Node]) -> Array[Node]:
	if not targets:
		return []
	
	var tree := targets[0].get_tree()
	
	match target:
		Target.SELF:
			return tree.get_nodes_in_group("player")
		Target.ALL_ENEMIES:
			return tree.get_nodes_in_group("enemies")
		Target.EVERYONE:
			return tree.get_nodes_in_group("player") + tree.get_nodes_in_group("enemies")
		_:
			return []


func play(targets: Array[Node], monster_stats: Stats) -> void:
	Events.move_played.emit(self)
	
	if is_single_targeted():
		apply_effects(targets)
	else:
		apply_effects(_get_targets(targets))
	

func apply_effects(_targets: Array[Node]) -> void:
	pass
	
