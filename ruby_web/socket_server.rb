#2022/06/23-08:29

require 'socket'

host, port = 'localhost', '2000'
server = TCPServer.open(host, port)

loop {
    client = server.accept
    puts client
    client.puts("Ruby Server")
    client.close
}