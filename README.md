# Squash the Creeps - 3D Game Project

https://github.com/user-attachments/assets/b10fd061-820f-4c26-8146-a07331536f23

Este proyecto es una implementación extendida del tutorial oficial de Godot "Your First 3D Game". Es un juego de arcade en 3D donde el jugador controla un personaje que debe esquivar enemigos y aplastarlos saltando sobre ellos, mientras sobrevive el mayor tiempo posible.

El proyecto fue desarrollado de manera colaborativa utilizando Godot Engine 4 y Git/GitHub para el control de versiones.

## Descripción del Juego

El objetivo es simple: sobrevivir. Los enemigos (Creeps) aparecen desde los bordes de la pantalla y se mueven en patrones aleatorios. El jugador debe esquivarlos o saltar sobre sus cabezas para eliminarlos y ganar puntos. Si un enemigo toca al jugador, el juego termina.

## Funcionalidades Implementadas (Mejoras)

Siguiendo los requisitos de la actividad de investigación y autoaprendizaje, hemos implementado las siguientes 3 mejoras sobre el juego base:

### 1. Sistema de Power-Ups (Doble Salto)

Implementamos una mecánica de ventaja temporal para el jugador.

Funcionalidad: Un objeto cilíndrico de color amarillo brillante (neón) aparece aleatoriamente dentro del área de juego.

Efecto: Al recogerlo, el jugador obtiene la habilidad de Doble Salto durante 10 segundos. Esto permite alcanzar enemigos más altos o corregir el movimiento en el aire.

Feedback: El objeto rota sobre su eje para ser visible y desaparece con un efecto de sonido al ser recolectado.

### 2. Audio y Retroalimentación (SFX)

Para mejorar la experiencia de juego ("Game Feel"), añadimos efectos de sonido específicos que no estaban en el tutorial original:

Salto: Sonido de impulso al presionar la tecla de salto.

Squash: Sonido de impacto al aplastar un enemigo exitosamente.

Power-Up: Sonido de "moneda" o bonificación al recoger el ítem de doble salto.

### 3. Estilo Visual y Fuentes Personalizadas

Modificamos la estética de la interfaz de usuario (UI) para darle un toque más retro.

Fuente: Se reemplazó la fuente predeterminada por una tipografía estilo Minecraft (Pixel Art). Esto afecta al puntaje en tiempo real, al mensaje de "Game Over" y al botón de reinicio.

Orientación: Ajustes en la rotación de los meshes para una presentación visual correcta.

# Controles

Moverse: Flechas de dirección / WASD

Saltar: Barra Espaciadora / Enter

Reiniciar: Enter (Cuando aparece la pantalla de Game Over)

# Aspectos Técnicos

Motor: Godot 4.x

Lenguaje: GDScript

Nodos Clave:

CharacterBody3D para el jugador y los enemigos.

Area3D para el Power-Up.

Path3D y PathFollow3D para el sistema de aparición de enemigos (Spawn).

AudioStreamPlayer3D para el sonido espacial.

# Autores

Este proyecto fue realizado por:

Jose Manuel Pantoja Rosas

Felipe Alejandro Fajardo Castro

Basado en el tutorial oficial de Godot Engine.
