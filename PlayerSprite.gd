extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dir = 0
var attacking = false
var super_leftright = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayerSprite_animation_finished():
	attacking = false

	if dir == 1:
		self.play("walk_up")
	elif dir == 2:
		self.play("walk_down")
	elif dir == 3:
		self.play("walk_right")
		self.flip_h = true
	elif dir == 4:
		self.play("walk_right")
		self.flip_h = false

	self.stop()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_W and !attacking:
			self.play("walk_up")
			dir = 1
			self.position = self.position + Vector2(0,-10)
		
		if event.scancode == KEY_S and !attacking:
			self.play("walk_down")
			dir = 2
			self.position = self.position + Vector2(0,10)

		if event.scancode == KEY_A and !attacking:
			self.play("walk_right")
			dir = 3
			self.flip_h = true
			self.position = self.position + Vector2(-10,0)

		if event.scancode == KEY_D and !attacking:
			self.play("walk_right")
			dir = 4
			self.flip_h = false
			self.position = self.position + Vector2(10,0)

		if event.scancode == KEY_K:
			attacking = true

			self.play("super")

		if event.scancode == KEY_J:
			attacking = true
			AudioManager.play("sou")
			
			if dir == 1:
				self.play("atk_up")
			elif dir == 2:
				self.play("atk_down")
			elif dir == 3:
				self.play("atk_right")
				self.flip_h = true
			elif dir == 4:
				self.play("atk_right")
				self.flip_h = false

	if event is InputEventKey and !event.pressed and !attacking:
		self.stop()
