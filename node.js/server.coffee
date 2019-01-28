#!/usr/bin/env coffee

http = require 'http'

server = http.createServer (req, resp) ->
  req.setEncoding('utf-8')

  console.log "#{req.method} #{req.url} HTTP/#{req.httpVersion}"

  for k, v of req.headers
    console.log "#{k.replace(/^\w|-\w/g, (s) -> s.toUpperCase())}: #{v}"

  console.log ''

  req.on('data', console.log)

  resp.setHeader('Access-Control-Allow-Origin', '*')
  resp.setHeader('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS')
  resp.setHeader('Access-Control-Allow-Headers', 'accept, cache-control, origin, x-requested-with, x-file-name, content-type')
  resp.writeHead(200)
  resp.end()

host = process.argv[3] or '127.0.0.1'
port = parseInt(process.argv[2] or 8080)
server.listen(port, host)

console.error "Server listening on #{host}:#{port}"
