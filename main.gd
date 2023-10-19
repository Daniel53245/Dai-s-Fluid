extends Node2D

var max_x = 1920
var max_y = max_x* 9/16

var gravity = 9.8
var particle_position = Vector2(100,100)
var particle_velocity = Vector2(100,100)
var particle_color = Color.DODGER_BLUE
var particle_radius = 50
var bound_x = max_x - particle_radius
var bound_y = max_y - particle_radius

func draw_boundry():
	draw_line(Vector2(0,0),Vector2(max_x,0),Color.YELLOW,5)
	draw_line(Vector2(max_x,0),Vector2(max_x,max_y),Color.YELLOW,5)
	draw_line(Vector2(max_x,max_y),Vector2(0,max_y),Color.YELLOW,5)
	draw_line(Vector2(0,max_y),Vector2(0,0),Color.YELLOW,5)

func resolve_boundry():
	if(particle_position.x > bound_x):
		particle_position.x = bound_x
		particle_velocity.x *= -1
	if(particle_position.x < particle_radius):
		particle_position.x = particle_radius
		particle_velocity.x *= -1
	if(particle_position.y > bound_y):
		particle_position.y = bound_y
		particle_velocity.y *= -1
	if(particle_position.y < particle_radius):
		particle_position.y = particle_radius
		particle_velocity.y *= -1

func _process(delta):
	#accelerating
	particle_velocity.y  = particle_velocity.y + gravity
	particle_position = particle_position + delta*particle_velocity
	resolve_boundry()
	queue_redraw()
	
func _draw():
	draw_boundry()
	draw_circle(particle_position, particle_radius, particle_color)


