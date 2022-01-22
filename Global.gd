extends Node

var node_creation_parent = null
var player = null

func instance_node(node, location, parent, node_param := 0):
	var node_instance = node.instance()
	if node_param != 0:
		node_instance._init(node_param)
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
