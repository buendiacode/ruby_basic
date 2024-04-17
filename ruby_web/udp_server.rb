#2022/06/23-18:41

require 'socket'

host, port = '127.0.0.1', '2525'
socket = UDPSocket.new
socket.bind(nil, port)

loop do
    request, addr = socket.recvfrom(1024)
    client_ip = addr[3]
    client_port = addr[1]
    socket.send(
        'Rails', 0,
        client_ip, 
        client_port
    )
    #socket.close
    puts addr[3], addr[2], addr[1], addr[0]
end