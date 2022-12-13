extends Control




func _on_Button_pressed():
	SceneChanger.goto_scene("res://Menu1.tscn",self)
	pass # Replace with function body.


func _on_Button2_pressed():
	get_tree().quit()


func _on_VideoPlayer_finished():
	$VBoxContainer.show()

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		$Panel/VideoPlayer.hide()
		$VBoxContainer.show()
