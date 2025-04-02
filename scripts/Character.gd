extends Node2D
class_name CharacterClass

@onready
var sprite: Sprite2D = Sprite2D.new()

var is_selected: bool = false

func _ready() -> void:
	sprite.texture = preload("res://assets/peasant.png")
	self.scale = Vector2(0.2, 0.2)
	self.position = Vector2(0, 0)
	self.add_child(sprite)

func _process(delta: float):
	pass
