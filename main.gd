extends Node2D



var max_x = 1920
var max_y = max_x* 9/16
var gravity = 9.8

var particle_positions = []
var particle_velocities = []
var particle_color = Color.DODGER_BLUE
var particle_radius = 50
var bound_x = max_x - particle_radius
var bound_y = max_y - particle_radius
var colision_damping = 1
var num_rows = 3
var columns = 5

func _ready():
	initltialise()

func initltialise():
	var x_pos = particle_radius 
	var y_pos = particle_radius * 2
	for i in range(num_rows):
		y_pos += particle_radius*2 + 10
		x_pos = particle_radius*2 
		for j in range(columns):
			print(x_pos)
			print(y_pos)
			particle_positions.append(Vector2(x_pos,y_pos))
			particle_velocities.append(Vector2(0,0))
			x_pos += particle_radius * 2 + 10
	print(len(particle_positions))
	print(len(particle_velocities))
	return

func draw_boundry():
	draw_line(Vector2(0,0),Vector2(max_x,0),Color.YELLOW,5)
	draw_line(Vector2(max_x,0),Vector2(max_x,max_y),Color.YELLOW,5)
	draw_line(Vector2(max_x,max_y),Vector2(0,max_y),Color.YELLOW,5)
	draw_line(Vector2(0,max_y),Vector2(0,0),Color.YELLOW,5)

func resolve_boundry():
	for p in range(len(particle_positions)):
		if(particle_positions[p].x > bound_x):
			particle_positions[p].x = bound_x
			particle_velocities[p].x *= -1 * colision_damping
		if(particle_positions[p].x < particle_radius):
			particle_positions[p].x = particle_radius
			particle_velocities[p].x *= -1 * colision_damping
		if(particle_positions[p].y > bound_y):
			particle_positions[p].y = bound_y
			particle_velocities[p].y *= -1 * colision_damping
		if(particle_positions[p].y < particle_radius):
			particle_positions[p].y = particle_radius
			particle_velocities[p].y *= -1 * colision_damping


func _process(delta):
	#accelerating
	for i in range(len(particle_positions)):
		particle_velocities[i].y  = particle_velocities[i].y + gravity
		particle_positions[i] = particle_positions[i] + delta*particle_velocities[i]
	resolve_boundry()
	queue_redraw()
	
func _draw():
	draw_boundry()
	for i in range(len(particle_positions)):
		draw_circle(particle_positions[i], particle_radius, particle_color)


