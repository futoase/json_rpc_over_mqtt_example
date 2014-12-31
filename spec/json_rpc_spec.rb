require 'spec_helper'

describe JSONRPCOverMQTT::JSONRPC do

  let(:error_response) { JSONRPCOverMQTT::JSONRPC::ErrorResponse }
  let(:json_rpc_version) { '2.0' }
  let(:json_rpc_id) { 100 }

  context 'when generate method not found a not exists valid request' do 
    let(:method_not_found) { JSON.parse(error_response.method_not_found(json_rpc_id)) }
    let(:error_code) { error_response::METHOD_NOT_FOUND[:code] }
    let(:error_message) { error_response::METHOD_NOT_FOUND[:message] }
    it "should be get response for method_not_found" do

      expect(method_not_found).to be_instance_of(Hash)
      expect(method_not_found).to include('jsonrpc')
      expect(method_not_found).to include('id')
      expect(method_not_found).to include('error')
      expect(method_not_found["jsonrpc"]).to eq(json_rpc_version)
      expect(method_not_found["id"]).to eq(json_rpc_id)
      expect(method_not_found["error"]["code"]).to eq(error_code)
      expect(method_not_found["error"]["message"]).to eq(error_message)
    end
  end

  context 'when generate method not found a not exists valid request' do 

    let(:parse_error) { JSON.parse(error_response.parse_error) }
    let(:error_code) { error_response::PARSE_ERROR[:code] }
    let(:error_message) { error_response::PARSE_ERROR[:message] }

    it "should be get response for parse_error" do

      expect(parse_error).to be_instance_of(Hash)
      expect(parse_error).to include('jsonrpc')
      expect(parse_error).to include('id')
      expect(parse_error).to include('error')
      expect(parse_error["jsonrpc"]).to eq(json_rpc_version)
      expect(parse_error["id"]).to eq(nil)
      expect(parse_error["error"]["code"]).to eq(error_code)
      expect(parse_error["error"]["message"]).to eq(error_message)
    end
  end

end
