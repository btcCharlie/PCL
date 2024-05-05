extends Node

class _interface:
	pass

class IDamageable extends _interface:
	func take_damage():
		pass
		

func get_all_descendants(node: Node) -> Array[Node]:
	var descendants: Array[Node] = [node]
	var children: Array[Node] = node.get_children()
	if children.size() > 0:
		for child: Node in children:
			descendants.append_array(get_all_descendants(child))
	return descendants

func _ready():
	# to check the existing nodes in the scene
	var descendants = get_all_descendants(get_tree().current_scene)
	for descendant in descendants:
		check_node(descendant)
		
	# to check all newly added nodes
	get_tree().node_added.connect(check_node)

func check_node(node: Node) -> void:
	if "implements" not in node:
		return
	
	assert(node.implements is Array[_interface], "Interface error: " + node.name + " has incorrectly defined interfaces!")
	
	for interface in node.implements:
		var instance: _interface = interface.new()
		for method in instance.get_script().get_script_method_list():
			assert(
				method.name in node, 
				"Interace Error: " + node.name + " does not contain " + method.name + " method!"
				)
		for property in node.get_script().get_script_property_list():
			assert(
				property.name in node, 
				"Interace Error: " + node.name + " does not contain " + property.name + " property!"
				)
		for signal_def in node.get_script().get_script_signal_def_list():
			assert(
				signal_def.name in node, 
				"Interace Error: " + node.name + " does not contain " + signal_def.name + " property!"
				)
