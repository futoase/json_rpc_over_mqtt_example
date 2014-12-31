module JSONRPCOverMQTT
  module JSONRPC

    class ErrorResponse
    
      METHOD_NOT_FOUND = {code: "-32601", message: "Method not found"}
      PARSE_ERROR = {code: "-32602", message: "JSON parse error"}
    
      def self.generate_response(json_rpc_id, error_response)
        ::JSON.generate({
          jsonrpc: VERSION,
          id: json_rpc_id,
          error: error_response
        })
      end
    
      def self.method_not_found(json_rpc_id)
        generate_response(json_rpc_id, METHOD_NOT_FOUND)
      end
    
      def self.parse_error
        generate_response(nil, PARSE_ERROR)
      end
    
     end

  end
end
