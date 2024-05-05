class_name ElementalType
extends Resource

enum ELEMENTAL_TYPE {Fire, Water, Grass, Normal, Dragon}

@export var name:ELEMENTAL_TYPE
@export var icon:Texture2D
@export var color:Color

@export var vulnerable_against:Array[ELEMENTAL_TYPE]
@export var resistant_against:Array[ELEMENTAL_TYPE]
@export var immune_against:Array[ELEMENTAL_TYPE]


func GetDamageModifierFor(other_type: ElementalType) -> float:
	if other_type.name in vulnerable_against:
		return 2.0
	elif other_type.name in resistant_against:
		return 0.5
	elif other_type.name in immune_against:
		return 0.0
	return 1.0
