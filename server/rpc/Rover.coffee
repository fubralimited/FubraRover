###
Class handles rover motors' speed and Reverse
@Author: Ray Viljoen
@Package: Fubra Rover
@SubPackage: Johnny-Five
###

module.exports = class Rover

	# Pin modes
	INPUT:   0
	OUTPUT:  1
	ANALOG:  2
	PWM:     3
	SERVO:   4

	# Set default RFRobotShop rover motor pins. Can overwrite with constructor
	# Requires Johnny-Five board instance
	constructor:(
		@board,
		@leftSpeed = 5,
		@rightSpeed = 6,
		@leftReverse = 7,
		@rightReverse = 8
		) ->
			# Initilise pin modes
			@.board.pinMode @.leftSpeed, @.PWM
			@.board.pinMode @.rightSpeed, @.PWM
			@.board.pinMode @.leftReverse, @.OUTPUT
			@.board.pinMode @.rightReverse, @.OUTPUT
			return

	# Set tracks to forward or only passed in track (left || right)
	setForwardMode: (track) ->
		if track then @.board.digitalWrite @["#{track}Reverse"], 0
		else
			@.board.digitalWrite @.leftReverse, 0
			@.board.digitalWrite @.rightReverse, 0 
		return

	# Set tracks to reverse or only passed in track (left || right)
	setReverseMode: (track) ->
		if track then @.board.digitalWrite @["#{track}Reverse"], 1
		else
			@.board.digitalWrite @.leftReverse, 1
			@.board.digitalWrite @.rightReverse, 1
		return

	# Speeds passed as percentage, so convert to bytes
	bytes: (percent) ->
		Math.floor percent*2.55

	# Move at percentage of full speed
	forward: (speed = 100, track) ->
		@.setForwardMode track
		@.setSpeed speed, track
		return

	# Reverse at percentage of full speed
	reverse: (speed = 100, track) ->
		@.setReverseMode track
		@.setSpeed speed, track
		return

	# Set speed
	setSpeed: (speed, track) ->
		bytes = Math.floor @.bytes speed
		if track then @.board.analogWrite(@["#{track}Speed"], bytes)
		else
			@.board.analogWrite @.leftSpeed, bytes
			@.board.analogWrite @.rightSpeed, bytes
		return

	# Stop rover and reset to forward direction
	stop: ->
		@.board.analogWrite @.leftSpeed, 0
		@.board.analogWrite @.rightSpeed, 0
		return





