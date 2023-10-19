extends Node2D

func _ready():
	update() # This ensures the _draw() function gets called.

func _draw():
	var circle_radius = 100
	var circle_position = Vector2(200, 200) # Adjust the position as needed.
	var circle_color = Color(1, 0, 0, 1) # RGBA: Red color in this example
	draw_circle(circle_position, circle_radius, circle_color)
