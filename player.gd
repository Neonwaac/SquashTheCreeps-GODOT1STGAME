extends CharacterBody3D

@export var speed = 14
@export var fall_acceleration = 75
@export var jump_impulse = 20
@export var bounce_impulse = 16
var double_jump_enabled = false
var jumps_left = 1
signal hit

var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	# Input
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(global_transform.origin + direction, Vector3.UP)
		$AnimationPlayer.speed_scale = 4
	else:
		$AnimationPlayer.speed_scale = 1

	# Movimiento horizontal
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	if is_on_floor():
		# Al tocar el piso, restauramos los saltos
		jumps_left = 2 if double_jump_enabled else 1
		if Input.is_action_just_pressed("jump"):
			if jumps_left == 1 and double_jump_enabled:
				$JumpSound.pitch_scale = 1.5 
			else:
				$JumpSound.pitch_scale = 1.0
			$JumpSound.play()
			target_velocity.y = jump_impulse
			jumps_left -= 1
		else:
			target_velocity.y = 0
	else:
		target_velocity.y -= fall_acceleration * delta
		if Input.is_action_just_pressed("jump") and jumps_left > 0:
			$JumpSound.play()
			target_velocity.y = jump_impulse
			jumps_left -= 1
	velocity = target_velocity

	# Mover
	move_and_slide()

	# Detectar colisiones
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
		var collider = collision.get_collider()
		if collider == null:
			continue
		
		# Es un mob
		if collider.is_in_group("mob"):
			# Golpea desde arriba
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				collider.squash()
				$SquashSound.play()
				target_velocity.y = bounce_impulse
				velocity = target_velocity
				break
	$Pivot.rotation.x = PI / 6 * velocity.y / jump_impulse
func activate_double_jump():
	double_jump_enabled = true
	jumps_left = 2
	$DoubleJumpTimer.start()

func die():
	hit.emit()
	queue_free()
	
func _on_mob_detector_body_entered(body: Node3D) -> void:
	die() 

func _on_double_jump_timer_timeout() -> void:
	double_jump_enabled = false
	jumps_left = 1
