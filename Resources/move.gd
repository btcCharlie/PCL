class_name Move
extends Resource

enum Type {ATTACK, SKILL, POWER}
enum Target {SELF, ALLY, ALL_ALLIES, SINGLE_ENEMY, ALL_ENEMIES, EVERYONE}

@export_group("Move Attributes")
@export var id: String
@export var type: Type
@export var target: Target
@export var element: ElementalType

func is_single_targeted() -> bool:
	return target == Target.SINGLE_ENEMY
	
