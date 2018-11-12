extends KinematicBody2D

export (int) var speed_move=5
var shoot_rate=1/3
var special=true
var velocity=Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func input():
	
	velocity=Vector2()
	
	if Input.is_action_pressed("up"):
		velocity.y-=1;
	if Input.is_action_pressed("down"):
		velocity.y+=1;
	if Input.is_action_pressed("left"):
		velocity.x-=1
	if Input.is_action_pressed("right"):
		velocity.x+=1	
		
	if Input.is_action_pressed("shoot"):
		shoot()	
		
	velocity=velocity.normalized()*speed_move	
	
	
	pass

func shoot():
	
	 
	
	pass	
	
func _physics_process(delta):
	
	input()
	move_and_collide(velocity)
	
	pass	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
