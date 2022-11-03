extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayerSprite_animation_finished():
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_W:
			self.play("walk_up")
			self.position = self.position + Vector2(0,-10)
		
		if event.scancode == KEY_S:
			self.play("walk_down")
			self.position = self.position + Vector2(0,10)

		if event.scancode == KEY_A:
			self.play("walk_right")
			self.flip_h = true
			self.position = self.position + Vector2(-10,0)

		if event.scancode == KEY_D:
			self.play("walk_right")
			self.flip_h = false
			self.position = self.position + Vector2(10,0)

	if event is InputEventKey and !event.pressed:
		self.stop()
