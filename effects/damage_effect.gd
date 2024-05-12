class_name DamageEffect
extends Effect

var amount := 0


func execute(targets: Array[Node]) -> void:
	for target in targets:
		if not target:
			continue
		if "implements" not in target:
			continue
		if I.Damageable in target.implements:
			target.take_damage(amount)
