extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed=10
var velocity=Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	pass

func _physics_process(delta):

	velocity=Vector2()
	velocity.x+=1
	position.x+=velocity.x*speed

	pass


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	
	queue_free()
	pass # Replace with function body.
