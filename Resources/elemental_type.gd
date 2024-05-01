class_name ElementalType
extends Resource

enum ELEMENTAL_TYPE {Fire, Water, Grass, Normal, Dragon}

@export var name:ELEMENTAL_TYPE
@export var icon:Texture2D
@export var color:Color

@export var vulnerable_against:Array[ELEMENTAL_TYPE]
@export var resistant_against:Array[ELEMENTAL_TYPE]
@export var immune_against:Array[ELEMENTAL_TYPE]
