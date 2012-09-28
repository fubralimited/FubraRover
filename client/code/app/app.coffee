# Client Code

console.log 'App Loaded'

master = null
left = null
right = null


track = $('.track')
range = track.height()

watchDrag = ->
	if left
		lSpeed = ((range - left.y)/range)*100
		lSpeed = Math.floor lSpeed
		ss.rpc 'roverRemote.left', lSpeed
	if right
		rSpeed = ((range - right.y)/range)*100
		rSpeed = Math.floor rSpeed
		ss.rpc 'roverRemote.right', lSpeed

hammerOpts =
	drag_min_distance: 0
	drag_horizontal: true
	drag_vertical: true
	transform: false
	hold: false
	prevent_default: true

track.hammer(hammerOpts).bind 'drag', (e) ->
	# Handle drag
	if $(e.target).hasClass('left')
		direct = 'left'
	else if $(e.target).hasClass('right')
		direct = 'right'
	master = direct if !master

	if master is 'left'
		left = e.touches[1]
		right = e.touches[0]
	else
		left = e.touches[0]
		right = e.touches[1]

track.hammer(hammerOpts).bind 'tap', (e) ->
	ss.rpc 'roverRemote.stop'

track.hammer(hammerOpts).bind 'dragend', (e) ->
	master = null
	left = null
	right = null
	ss.rpc 'roverRemote.stop'


setInterval watchDrag, 100