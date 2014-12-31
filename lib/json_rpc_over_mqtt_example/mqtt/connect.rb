module JSONRPCOverMQTT
  module MQTT

    class Connect
      def self.start

        ::MQTT::Client.connect(BROKER_ADDRESS) do |c|
          c.get(SERVER_TOPIC_NAME) do |topic, message|
            logger.info("TOPIC: #{topic} MESSAGE:#{message}")
        
            begin
              request = JSONRPC::Request.new(message)
        
              unless request.params.nil?
                result = method(request.method).call(**request.params)
              else
                result = method(request.method).call
              end
        
              c.publish(
                CLIENT_TOPIC_NAME, 
                JSONRPC::Response.generate(request.id, result)
              )
            rescue ::JSON::ParserError => e
              c.publish(
                CLIENT_TOPIC_NAME, 
                JSONRPC::ErrorResponse.parse_error
              )
            rescue NameError => e
              c.publish(
                CLIENT_TOPIC_NAME,
                JSONRPC::ErrorResponse.method_not_found(request.id)
              )
            end
          end
        end
      end
    end

  end
end
