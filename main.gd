extends Node


var score : int = 0


func _ready() -> void:
	var save : File = File.new()
	if save.file_exists("user://save"):
	# warning-ignore:return_value_discarded
		save.open("user://save", File.READ)
		score = save.get_64()
	save.close()
	update()


func _input(event : InputEvent) -> void:
	update()
	if OS.get_name() == "HTML5":
		return
	if event.is_action_released("quit"):
		quit()


func update() -> void:
	score += 1
	$Label.text = String(score)


func quit() -> void:
	save()
	get_tree().quit()


func save() -> void:
	var save : File = File.new()
	# warning-ignore:return_value_discarded
	save.open("user://save", File.WRITE)
	save.store_64(score)
	save.close()
