class_name Monster
extends Resource

enum MONSTER_TYPE {FIRE, WATER, GRASS}

@export var name:String
@export var type:Array[ElementalType]
@export_range(1, 100) var attack:int
@export_range(1, 100) var spec_attack:int
@export_range(1, 100) var defense:int
@export_range(1, 100) var spec_defense:int
@export_range(10, 1000) var max_health:int
@export_range(10, 1000) var max_stress:int

@export var scene:PackedScene
