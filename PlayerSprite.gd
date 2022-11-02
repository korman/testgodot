extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.play("walk_right")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayerSprite_animation_finished():
	self.flip_h = !self.flip_h

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_W:
			self.play("walk_up")
		
		if event.scancode == KEY_S:
			self.play("walk_down")

	if event is InputEventKey and event.press
