extends CharacterBody2D

var direction: Vector2 = Vector2(1, 1)
var speed: int = 2.5



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(_delta: float)->void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	animation()
	move_and_slide()
	
	
	if Input.is_action_just_pressed("confrim"):
		print("something")
	position += direction * speed
	
func animation():
	if direction == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
		return

	if direction.y < 0:
		$AnimatedSprite2D.play("up")
	elif direction.y > 0:
		$AnimatedSprite2D.play("down")
	else:
		$AnimatedSprite2D.play("side")
		$AnimatedSprite2D.flip_h = direction.x > 0
