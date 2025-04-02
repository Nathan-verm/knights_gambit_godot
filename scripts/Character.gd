extends Node2D
class_name CharacterClass

@onready
var sprite: Sprite2D = Sprite2D.new()

var is_selected: bool = false




#attack tiles is defined as following: 1 element of this list is a 2-tuple: [1, 3] => first number means how many tiles horizontaly and second is vertically
#visual representation:
#player: x
#attack tile: O
#attack: [1, 3]

######
####O#
######
######
###x##
######

var attack_tiles: Array[AttackTile]

func _ready() -> void:
	sprite.texture = preload("res://assets/peasant.png")
	self.scale = Vector2(0.2, 0.2)
	self.position = Vector2(0, 0)
	self.add_child(sprite)

func _process(delta: float):
	pass


func get_attack_tiles():
	return self.attack_tiles
