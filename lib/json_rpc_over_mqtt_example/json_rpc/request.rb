module JSONRPCOverMQTT
  module JSONRPC

    class Request

      attr_reader :id, :method, :params

      def initialize(message)
        json_rpc_obj = JSON.parse(message)
        @id = json_rpc_obj["id"]
        @method = json_rpc_obj["method"]

        if json_rpc_obj["params"].nil?
          @params = nil
        else
          @params = Hash[json_rpc_obj["params"].map{ |k,v| [k.to_sym, v] }]
        end
      end
    end

  end
end
