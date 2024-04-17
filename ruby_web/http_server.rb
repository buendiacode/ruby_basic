#2022/06/23-18:24

require 'socket'

host, port = 'localhost', '2525'
socket = TCPServer.open(host, port)

response = <<-RES
HTTP/1.0 200 OK
Content-Type: text/html

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>ruby</title>
<meta name="viewport" content="width=device-width">
</head>
<body>
<p>hello Ruby socket</p>
<script>

</script>
</body>
</html>
RES

assets_route = '/ruby_assets'

def openHTML(path) 
    file = File.open(path)
    html = file.read
    return html
end

def analyzePath(http_req)
    space1 = http_req.indexOf(' ') #first space
    space2 = http_req.indexOf(' ', space1)
    path = http_req.getString(space1, space2)
end

loop {
    client = socket.accept
    #client.puts response
    puts client.gets
    puts client
    #path = analyzePath(client.gets)
    #html = openHTML(path)
    http_head = "HTTP/1.0 200 OK \n Content-Type: text/html \n\n"
    client.puts(http_head + File.open('./ruby_assets/index.html').read)
    #client.puts(response)
    client.close
}