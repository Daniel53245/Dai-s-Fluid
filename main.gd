extends Node2D

var max_x = 2000
var max_y = max_x* 9/16

var particle_position = Vector2(100,100)
var particle_velocity = Vector2(10,10)
var particle_color = Color.DODGER_BLUE
var particle_radius = 100


func draw_boundry():
	draw_line(Vector2(0,0),Vector2(max_x,0),Color.YELLOW,5)
	draw_line(Vector2(max_x,0),Vector2(max_x,max_y),Color.YELLOW,5)
	draw_line(Vector2(max_x,max_y),Vector2(0,max_y),Color.YELLOW,5)
	draw_line(Vector2(0,max_y),Vector2(0,0),Color.YELLOW,5)

func _process(delta):
	particle_position = particle_position + delta*particle_velocity
	queue_redraw()
	
func _draw():
	draw_boundry()
	draw_circle(particle_position, particle_radius, particle_color)

