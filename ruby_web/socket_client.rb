#2022/06/23-18:26

require 'socket'

host, port = 'localhost', '2525'
server = TCPSocket.open(host,port)

while line = server.gets do
    puts line
end