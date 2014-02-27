net = require 'net'

listener = (c) ->
	client = net.connect {port: 9200}, () -> console.log 'connected!'
	client.on 'connect', () ->
		console.log "HELLO"

	client.on 'data', (data) ->
		c.write(data)
		console.log data.toString()

	c.on 'data', (data) ->
		console.log data.toString()
		client.write data
		


server = net.createServer(listener)
server.listen(9201)
