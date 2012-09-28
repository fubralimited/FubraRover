five = require 'johnny-five'
http = require 'http'
Rover = require '../lib/Rover'
stat = require 'node-static'
socketIO = require 'socket.io'

board = new five.Board()

board.on 'ready', ->

	rover = new Rover @

	file = new(stat.Server) './'

	server = http.createServer (req, res) ->
	    req.addListener 'end', ->
	        file.serve req, res
	server.listen 3333

	io = socketIO.listen server


	io.sockets.on 'connection', (socket) ->
  		socket.on 'roverCommand', (data) ->
    		rover.forward(100) if data.key is 'up'
    		rover.reverse(100) if data.key is 'down'
    		rover.stop() if data.key is 'space'
    		if data.key is 'left'
    			rover.forward 100, 'left'
    			rover.reverse 100, 'right' 
    		if data.key is 'right'
    			rover.forward 100, 'right'
    			rover.reverse 100, 'left'

