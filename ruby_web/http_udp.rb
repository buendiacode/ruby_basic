# 2022/06/28-08:25

require 'socket'

host, port = 'localhost', '2525'
http = UDPSocket.new
http.bind(nil, port)

#File.open(http_resp.txt)
response = <<-HTTP
HTTP/1.0 200 OK
Content-Type: text/html

<!doctype html>
<html>
<head>

</head>
<body>
<section>
    Golang
</section>
</body>
</html>
HTTP
loop do
    req, addr = http.recvfrom(1024)
    http.send(
        response, 0, addr[3], 
        addr[1]
    )

end