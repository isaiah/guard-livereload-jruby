require 'json'
require 'java'
java_import "java.io.BufferedReader"
java_import "java.io.IOException"
java_import "java.io.InputStreamReader"
java_import "java.net.InetSocketAddress"
java_import "java.net.UnknownHostException"

java_import "org.java_websocket.WebSocket"
java_import "org.java_websocket.handshake.ClientHandshake"
java_import "org.java_websocket.server.WebSocketServer"

module Guard
  class LiveReload
    class Reactor

      def initialize(options = {})
        WebSocket.DEBUG = true
        start_reactor(options)
      end

      def stop
        @server.stop
      end

      def reload_browser(paths = [])
        puts "Reloading browser: #{paths.join(' ')}"
        data = {command: "reload", path: paths.join(' ')}
        @server.send_to_all(data.to_json)
      end
      
      private
      def start_reactor(options)
        @server = GuardServer.new(options[:port].to_i)
        @server.start
      end
    end

    class GuardServer < WebSocketServer
      def initialize(port)
        super(InetSocketAddress.new(port))
      end

      def onMessage(conn, message)
        puts "Browser connected: #{message}"
      end

      def onClose(conn, code, reason, remote)
        puts "Browser disconnected"
      end

      def onOpen(conn, handshake)
      end

      def onError(conn, ex)
      end

      def send_to_all(msg)
        conns = connections
        puts "send all"
        conns.each do |ws|
          puts "======"
          ws.send(msg)
        end
      end
    end
  end
end
