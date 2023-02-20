extends ParallaxBackground


export (float) var scrolling_speed = 200

func _process(delta):
	scroll_base_offset.y += scrolling_speed * delta
