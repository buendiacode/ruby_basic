# 2022/11/24-10:29

require 'webrick'

config = {
    Port:8000, 
    DocumentRoot:'./ruby_assets'
}

srv = WEBrick.HTTPServer.new(config)

trap(:INT) do 
    srv.shutdown
end

srv.start