five = require 'johnny-five'
Rover = require './Rover'

board = new five.Board()
rover = null

board.on 'ready', ->
	rover = new Rover @

exports.actions = (req, res, ss) ->
	{	
		
		forward: ->
			speed = req.params[0]
			rover.forward speed
		stop: ->
			do rover.stop

		left: ->
			speed = req.params[0]
			rover.forward speed, 'left'
		right: ->
			speed = req.params[0]
			rover.forward speed, 'right'
	}