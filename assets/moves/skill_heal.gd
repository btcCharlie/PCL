extends Move


func apply_effects(targets: Array[Node]) -> void:
	var heal_effect := HealEffect.new()
	heal_effect.amount = 6
	heal_effect.execute(targets)
