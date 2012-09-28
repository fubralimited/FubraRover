five = require 'johnny-five'
http = require 'http'
stat = require 'node-static'

board = new five.Board()

board.on 'ready', ->

	led = new five.Led({pin: 13})

	file = new(stat.Server) './public'

	server = http.createServer (req, res) ->
	    req.addListener 'end', ->
	        file.serve req, res
	server.listen 3333

	io = require('socket.io').listen server
	io.configure 'development', ->
		io.set 'log level', 0

	io.sockets.on 'connection', (socket) ->
  		socket.on 'roverCommand', (data) ->
  			console.log data.key
  			do led.on if data.key is 'up'
    		do led.off if data.key is 'down'
    
    

