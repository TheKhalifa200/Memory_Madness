extends Node

const TILE_IMAGES: TileImagesHolder = preload("uid://75dw3m6oh252")
const FRAME_IMAGES: Array[Texture2D]=[
	 preload("uid://cjcf7idgsgxox"),
	 preload("uid://cyjyaln8a0f4a"),
	preload("uid://d3t5ppi2ft6n0"),
	 preload("uid://dyx6eqyd6krol")
	
]

func get_random_frame_image()->Texture2D:
	return FRAME_IMAGES.pick_random()
func get_random_item_image()->Texture2D:
	return TILE_IMAGES.tile_images.pick_random()

func shuffle_images()->void:
	TILE_IMAGES.tile_images.shuffle()
	
func get_images_at_index(index:int)->Texture2D:
	if index > TILE_IMAGES.tile_images.size() or index<0:
		printerr("get_image_atindex index issue:", index)
	return TILE_IMAGES.tile_images[index]
