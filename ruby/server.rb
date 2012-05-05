#!/usr/bin/env ruby

require 'socket'

host = ARGV[2] || '127.0.0.1'
port = (ARGV[1] || 8080).to_i

server = TCPServer.new(host, port)

$stderr.puts "Server listening on #{host}:#{port}\n\n"

begin
  loop do
    client = server.accept
    loop do
      line = client.gets
      break if line == "\r\n"
      puts line
    end
    puts
    client.puts "HTTP/1.1 200 OK"
    client.close()
  end
rescue SystemExit, Interrupt
  server.close()
end
