extends CanvasLayer
class_name UI

signal start_game()
signal menu_opened()
signal menu_closed()
signal quit_to_menu()

@onready var score_label = %Score
@onready var menu = %GameMenu
@onready var main_menu = %MainMenu
var score = 0:
	set(new_score):
		score = new_score
		_update_score_label()

func _ready() -> void:
	_update_score_label()

func _input(event: InputEvent) -> void:
	if !main_menu.visible and event.is_action_pressed('ui_cancel'):
		menu.visible = !menu.visible
		if menu.visible:
			menu_opened.emit()
		else:
			menu_closed.emit()

func _update_score_label():
	score_label.text = str(score)

func _on_collected(collectable) -> void:
	if collectable:
		score += 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_main_menu_start_game() -> void:
	start_game.emit()
	


func _on_game_menu_main_menu() -> void:
	menu.hide()
	quit_to_menu.emit()
	main_menu.show()


func _on_game_menu_return_to_game() -> void:
	menu.hide()
	menu_closed.emit()
