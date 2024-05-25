class_name MoveSet
extends Resource

@export var moves: Array[Move] = []


func reorder(old_place: int, new_place: int) -> void:
	if (old_place >= moves.size() or new_place >= moves.size()):
		return
	moves.insert(new_place, moves[old_place])
	if new_place >= old_place:
		moves.remove_at(old_place)
	else:
		moves.remove_at(old_place + 1)

	
func add_move(move: Move) -> void:
	moves.append(move)


func remove_move(move: Move) -> void:
	moves.remove_at(moves.find(move))


func _to_string():
	var _move_strings: PackedStringArray = []
	for i in range(moves.size()):
		_move_strings.append("%s: %s" % [i + 1, moves[i].id])
	return "\n".join(_move_strings)
