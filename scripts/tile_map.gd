extends Node2D
class_name TileMapClass

@onready
var characters: Array[CharacterClass]

@onready var tiles = Node2D.new()
@onready var tile_scene = preload("res://scenes/Tile.tscn")


var ROWS = 13
var COLS = 9
var selected_tile: TileClass

func _ready():
	
	#TEMP
	characters = [CharacterClass.new()]
	for character in characters:
		var attack_tile = AttackTile.new()
		attack_tile.attack = [0, 1]
		character.attack_tiles = [attack_tile]

		character.z_index = 1
	#TEMP


	init_tile_map()
	self.add_child(tiles)



func tile_clicked(target_tile: TileClass):
	if selected_tile == null:
		select_tile(target_tile)
	else: #already tile clicked => check if selected_tile has a character on it

		if selected_tile.get_maybe_character() != null:
			#change ownership of character
			var character = selected_tile.get_maybe_character()
			selected_tile.remove_maybe_character()
			target_tile.set_maybe_character(character)

			selected_tile.unselect()
			

			
		else: #there was no character on this so just select tile
			select_tile(target_tile)


func select_tile(tile: TileClass):
	if tile == null and selected_tile == null:
		return

	if self.selected_tile != null:
		selected_tile.unselect()

	if tile != null:
		tile.select()

	self.selected_tile = tile



func init_tile_map():
	tiles.z_index = -1
	#first make all the tiles and add to the scene
	var locale_tiles: Array[TileClass] = []
	for i in range(ROWS):
		for j in range(COLS):

			var tile: TileClass = tile_scene.instantiate() as TileClass
			tile.position.x = TileClass.size * j + TileClass.size * 0.5
			tile.position.y = TileClass.size * i + TileClass.size * 0.5

			locale_tiles.append(tile)
			tiles.add_child(tile)

			if i == 1 and j == 1:
				tile.maybe_character = self.characters[0]
			# break
		# break
			
	#now make all the characters and add in tiles


	for i in range(len(characters)):
		locale_tiles[i].set_maybe_character(characters[i])
		
		
	
