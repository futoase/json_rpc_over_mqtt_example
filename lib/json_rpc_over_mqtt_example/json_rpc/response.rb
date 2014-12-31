module JSONRPCOverMQTT
  module JSONRPC

    class Response
      def self.generate_response(json_rpc_id, response)
        ::JSON.generate({
          jsonrpc: VERSION,
          id: json_rpc_id,
          result: response
        })
      end

      def self.generate(json_rpc_id, response)
        generate_response(json_rpc_id, response)
      end
    end

  end
end
