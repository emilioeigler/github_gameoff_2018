extends KinematicBody2D

export(PackedScene) var Bala
export(PackedScene) var Laser

var angle = 0
var direction = true
var vectorDirection
var vectorPosition
var timer = 0
var timer2 = 0
var counter = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	timer+=1
	if timer2 ==0:
		if angle<=-0.3:
			direction = true
		if angle>=0.4:
			direction = false
			 
		if direction:
			rotate(0.01)
			angle += 0.01
		if !direction:
			rotate(-0.01)
			angle -= 0.01
	
		if timer==10 || timer==17 || timer==24:
			var bala_instance = Bala.instance()
			vectorPosition = $Sprite2/PositionBullet.global_position + position - $Sprite2.global_position
			bala_instance.pos = vectorPosition
			#bala_instance.pos.y -= $Sprite2.position.y
			bala_instance.pos.x = $Sprite2.position.x *2.5 

			vectorDirection = $Sprite2/PositionBullet.global_position
			vectorDirection.x = $Sprite2/PositionBullet.global_position.x - global_position.x
			vectorDirection.y = $Sprite2/PositionBullet.global_position.y - global_position.y
			
			bala_instance.dir = vectorDirection
		
			get_parent().add_child(bala_instance)
	if timer>60:
		timer = 0
		counter+=1
		
	if counter == 5:
		timer2 = 1
		if angle!=0:
			if angle<=-0.3:
				direction = true
			if angle>=0.4:
				direction = false
			 
			if direction:
				rotate(0.01)
				angle += 0.01
			if !direction:
				rotate(-0.01)
				angle -= 0.01
		
		
	if timer2 == 1:
		var laser_instance = Laser.instance()
		laser_instance.pos = Vector2(-75,-134)
		laser_instance.add_collision_exception_with(self) 
		get_parent().add_child(laser_instance)
		counter+=1
		if counter==100:
			timer2=0
			timer = 0
			counter=0
			direction = true




