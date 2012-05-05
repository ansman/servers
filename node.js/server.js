#!/usr/bin/env node

var http = require('http');

host = process.argv[3] || '127.0.0.1'
port = parseInt(process.argv[2] || 8080)

http.createServer(function(req, resp) {
  var k, v;
  req.setEncoding('utf-8');

  console.log(req.method + ' ' + req.url + ' HTTP/' + req.httpVersion);

  var k, v;
  for(k in req.headers) {
    v = req.headers[k];
    k = k.replace(/^\w|-\w/g, function(s) { return s.toUpperCase(); });
    console.log(k + ": " + v);
  }

  console.log('');

  req.on('data', console.log);

  resp.writeHead(200);
  resp.end();
}).listen(port, host);

console.error('Server listening on ' + host + ':' + port)
