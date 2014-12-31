require 'json'
require 'mqtt'

require_relative File.expand_path(__dir__ + '/../config/const')
require_relative 'json_rpc_over_mqtt_example/logger'
require_relative 'json_rpc_over_mqtt_example/json_rpc'
require_relative 'json_rpc_over_mqtt_example/mqtt'

__my_dir__ = File.expand_path(__dir__)
functions_dir = File.expand_path(__my_dir__ + '/json_rpc_over_mqtt_example/functions/**/*.rb')

# Include functions
Dir.glob(functions_dir).map { |f| require_relative f }
