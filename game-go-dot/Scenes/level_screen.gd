extends Node2D

@onready var Heart_Container: HBoxContainer = $HeartContainer
@onready var Heart: TextureRect = $HeartContainer/Heart
@onready var Heart_2: TextureRect = $HeartContainer/Heart2
@onready var Heart_3: TextureRect = $HeartContainer/Heart3
@onready var Heart_4: TextureRect = $HeartContainer/Heart4
@onready var Heart_5: TextureRect = $HeartContainer/Heart5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await Timer(5.0)
	
	if Global.minigames_done < 3: 
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file()
		
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.lives:
		4:
			Heart.hide()
		3:
			Heart.hide()
			Heart_2.hide()
		2:
			Heart.hide()
			Heart_2.hide()
			Heart_3.hide()
		1:
			Heart.hide()
			Heart_2.hide()
			Heart_3.hide()
			Heart_4.hide()
		0:
			Heart_Container.hide()

	Timer.text = str(time)
	Level.text = "Level" + str(Global.minigames_done)

Func Timer(start_time: float):
	time = start_time
	
	while time > 0.0:
		await wait (0.1)
		time -= 0.1
	
	return
	func wait(seconds: float) -> void
			await get_tree()create_timer(seconds).timeout
