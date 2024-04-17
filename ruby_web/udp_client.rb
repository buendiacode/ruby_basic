#2022/06/24-08:30

require 'socket'

host, port, request = '127.0.0.1', '2525', 'ruby'
socket = UDPSocket.new
socket.connect(host, port)
socket.send(request, 0)
response, addr = socket.recvfrom(1024)
puts response