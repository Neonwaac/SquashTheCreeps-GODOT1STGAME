extends Node

@export var mob_scene: PackedScene
@export var power_up_scene: PackedScene

func _ready():
	$UserInterface/Retry.hide()


func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	# And give it a random offset.
	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.position
	mob.initialize(mob_spawn_location.global_position, player_position)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)

	# We connect the mob to the score label to update the score upon squashing one.
	mob.squashed.connect($UserInterface/ScoreLabel._on_mob_squashed.bind())

func _on_player_hit():
	$Timer.stop()
	$UserInterface/Retry.show()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		# This restarts the current scene.
		get_tree().reload_current_scene()


func _on_power_up_timer_timeout():
	# Crear instancia
	print("¡El Timer se disparó! Intentando crear Power Up...")
	var power_up = power_up_scene.instantiate()
	
	# Definir un rango aleatorio dentro del piso.
	# Asumiendo que el piso es de aprox 30x30 u 20x20 metros.
	# Ajusta estos números (-13, 13) según el tamaño de tu MeshInstance del Ground.
	var random_x = randf_range(-13, 13)
	var random_z = randf_range(-13, 13)
	
	# Asignar posición (Y=1 para que flote un poco sobre el suelo)
	power_up.position = Vector3(random_x, 1, random_z)
	
	# Añadir al juego
	add_child(power_up)
	print("Power Up añadido a la escena en: ", power_up.position) # <--- Y ESTO
