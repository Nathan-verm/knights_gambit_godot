extends Node2D
class_name TileClass

static var size = 64

@onready var tile_map_root: TileMapClass = get_parent().get_parent()
@onready var sprite: Sprite2D = Sprite2D.new()

var maybe_character: CharacterClass = null

func _ready():
	self.add_child(sprite)
	sprite.texture = preload("res://assets/tile.png")

	# Ensure the sprite is scaled to 64x64
	if sprite.texture:
		var texture_size = sprite.texture.get_size()
		sprite.scale = Vector2(size / texture_size.x, size / texture_size.y)


#this checks if a tile is pressed or not
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var sprite_rect = Rect2(sprite.global_position - (sprite.texture.get_size() * sprite.scale * 0.5), sprite.texture.get_size() * sprite.scale)
		if sprite_rect.has_point(event.position):
			tile_map_root.tile_clicked(self)


func get_maybe_character():
	return self.maybe_character

func set_maybe_character(character: CharacterClass):
	self.maybe_character = character
	self.add_child(character)

func remove_maybe_character():
	if self.maybe_character == null:
		return 

	self.remove_child(maybe_character)
	self.maybe_character = null

func get_x():
	return self.position.x

func get_y():
	return self.position.y 

func select():
	sprite.modulate = Color(0.2, 0.2, 0.2)

func unselect():
	sprite.modulate = Color(1, 1, 1)
