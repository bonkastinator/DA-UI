extends Control

enum Fractions {
	STARSERAPHS,
	OLYMPUS,
	DARKTEMPLARS
}

var chosen_fraction

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_return_button_pressed():
	$ButtonClickSound.play()
	# leave lobby if guest
	# close lobby if host
	# return to play menu
	get_tree().change_scene_to_file("res://UI/play_menu.tscn")

func _on_return_button_mouse_entered():
	$ButtonHoverSound.play()

# Ready Button
func _on_game_start_button_pressed():
	$ButtonClickSound.play()

func _on_game_start_button_mouse_entered():
	$ButtonHoverSound.play()


func _on_game_start_button_toggled(toggled_on):
	if toggled_on:
		$GameStartButton.text = "Ready!"
		# TODO: if both players are ready and 2 different Fractions are chosen the game can start after [time]
		# TODO: method_name(chosen_fraction)
	else:
		$GameStartButton.text = "Ready?"


func _on_choose_star_seraphs_button_toggled(toggled_on):
	if toggled_on:
		$ChooseFraction/ChooseStarSeraphsButton.scale = Vector2(2.2, 2.2)
		$ChooseFraction/ChooseStarSeraphsButton.position = Vector2(1490, 700)
		chosen_fraction = Fractions.STARSERAPHS
	else:
		$ChooseFraction/ChooseStarSeraphsButton.scale = Vector2(2, 2)
		$ChooseFraction/ChooseStarSeraphsButton.position = Vector2(1500, 710)


func _on_choose_olympus_button_toggled(toggled_on):
	if toggled_on:
		$ChooseFraction/ChooseOlympusButton.scale = Vector2(2.2, 2.2)
		$ChooseFraction/ChooseOlympusButton.position = Vector2(1490, 476)
		chosen_fraction = Fractions.OLYMPUS
	else:
		$ChooseFraction/ChooseOlympusButton.scale = Vector2(2, 2)
		$ChooseFraction/ChooseOlympusButton.position = Vector2(1500, 486)


func _on_choose_dark_templars_button_toggled(toggled_on):
	if toggled_on:
		$ChooseFraction/ChooseDarkTemplarsButton.scale = Vector2(2.2, 2.2)
		$ChooseFraction/ChooseDarkTemplarsButton.position = Vector2(1490, 250)
		chosen_fraction = Fractions.DARKTEMPLARS
	else:
		$ChooseFraction/ChooseDarkTemplarsButton.scale = Vector2(2, 2)
		$ChooseFraction/ChooseDarkTemplarsButton.position = Vector2(1500, 260)
