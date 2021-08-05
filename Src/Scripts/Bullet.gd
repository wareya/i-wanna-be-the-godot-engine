extends Area2D

onready var animation = $AnimatedSprite
onready var sound = $Sound
onready var speed = 500

func _ready():
	animation.play("Bullet")
	speed = speed*get_parent().get_node("Player").direction
	sound.play()
	

func _physics_process(delta):
	position.x += speed * delta


func _on_Bullet_body_entered(body):
	if not body.name == "Player":
		get_parent().get_node("Player").bullets -= 1
		get_parent().remove_child(self)
