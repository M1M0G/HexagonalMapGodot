extends Node3D
class_name Game

@export var WorldScene: PackedScene
@export var ui:UI
@export var world: World

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#call_deferred('start_game')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func start_game():
	world = WorldScene.instantiate()
	add_child(world)
	move_child(world, 0)


func _on_ui_start_game() -> void:
	start_game()


func _on_ui_quit_to_menu() -> void:
	if world:
		world.queue_free()
		world = null
