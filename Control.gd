extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hits = 0
var started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuBG.show()
	$PlayButton.show()
	$ReplayButton.hide()
	$MenuLabel.show()
	$MenuLabel.text = "Press space to hit chris rock\nyou have 30 seconds!"
	$Smack.hide()
	$HitCounter.hide()
	$TimeCounter.hide()
	$Fabri.hide()
	$FabriText.hide()
	started = false
	
func _process(delta):
	if(!started):
		pass
	$TimeCounter.text = "Time Left: " + str(int($GameTimer.time_left))
	if(Input.is_action_just_pressed("smack")):
		_hit()
	if(Input.is_action_just_released("smack")):
		$Smack/AnimatedSprite.play("idle")
		
func _startGame():
	$MenuBG.hide()
	$PlayButton.hide()
	$MenuLabel.hide()
	$Smack.show()
	$HitCounter.show()
	$TimeCounter.show()
	hits = 0
	started = true
	$GameTimer.start()
	


func _time_over():
	$MenuBG.show()
	$MenuLabel.show()
	$MenuLabel.text = "You've hit Chris Rock " + str(hits) + " times!"
	$Fabri.show()
	$FabriText.show()
	$ReplayButton.show()
	$Smack.hide()
	$HitCounter.hide()
	$TimeCounter.hide()
	started = false
	pass

func _hit():
	$Smack/AnimatedSprite.play("smack")
	$PunchSound.play()
	$PunchSound.stop()
	hits += 1
	$HitCounter.text =  "Slaps: " + str(hits)


