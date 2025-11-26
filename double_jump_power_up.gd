extends Area3D

func _on_body_entered(body):
	# Verificamos si es el jugador
	if body.has_method("activate_double_jump"):
		body.activate_double_jump()
		
		# 1. Reproducir el sonido
		$AudioStreamPlayer3D.play()
		
		# 2. Ocultar la malla para que parezca que "desapareció"
		$MeshInstance3D.visible = false
		
		# 3. Desactivar la colisión para no agarrarlo dos veces por error
		# Usamos set_deferred porque estamos en medio de una colisión física
		$CollisionShape3D.set_deferred("disabled", true)
		
		# 4. Esperar a que el sonido termine
		await $AudioStreamPlayer3D.finished
		
		# 5. AHORA SÍ borramos el objeto
		queue_free()
