
# FubraRover Web Interface

http = 		require 'http'
ss = 		require 'socketstream'
config = 	require './config'

# Define a single-page client called 'main'
ss.client.define 'main', {
  view: 'app.jade'
  css:  ['app.styl']
  code: ['libs/jquery.min.js', 'libs/hammer.js', 'libs/jquery.hammer.js', 'app']
  tmpl: '*'
}

# Serve this client on the root URL
ss.http.route '/', (req, res) ->
	res.serveClient 'main'

# Code Formatters
ss.client.formatters.add require('ss-coffee')
ss.client.formatters.add require('ss-jade')
ss.client.formatters.add require('ss-stylus')

# Use server-side compiled Hogan (Mustache) templates. Others engines available
ss.client.templateEngine.use require('ss-hogan')

# Minimize and pack assets if you type: SS_ENV=production node app.js
do ss.client.packAssets if ss.env is 'production'

# Start web server
server = http.Server ss.http.middleware
server.listen config.port, config.ip

# Start SocketStream
ss.start server