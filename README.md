# JSON-RPC over MQTT example

JSON-RPC over MQTT example

## Installation

```ruby
> gem 'json_rpc_over_mqtt_example'
```

## Usage

Setup of the MQTT Broker in your machine.
Mosquitto is better.

### Setup of the MQTT Broker

- Mac OS X (homebrew)

Install

```
> brew install mosquitto
```

Starting MQTT Broker

```
> launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mosquitto.plist
```

### Connect MQTT subscriber to MQTT Broker

```
> mosquitto_sub -h localhost -t client
```

### Starting demo server

Starting JSON-RPC over MQTT example demo server.

```
> json_rpc_over_mqtt_server
```

### Publish message to MQTT Broker

Publish message to a MQTT Broker.

- ping

Publisher

```
> mosquitto_pub -h localhost -t server -m '{"jsonrpc": "2.0", "id": 2, "method": "ping", "params": {"url": "yahoo.co.jp"}}'
```

Subscriber

```
> {"jsonrpc":"2.0","id":2,"result":"OK: yahoo.co.jp"}
```

- hello world

Publisher

```
> mosquitto_pub -h localhost -t server -m '{"jsonrpc": "2.0", "id": 1000, "method": "hello_world", "params": {"name": "Bob"}}'
```

Subscriber

```
> {"jsonrpc":"2.0","id":1000,"result":"Hello World, Bob!"}
```

- what time is it

Publisher

```
> mosquitto_pub -h localhost  -t server -m '{"jsonrpc": "2.0", "id": 1000, "method": "what_time_is_it?"}'
```

Subscriber

```
> {"jsonrpc":"2.0","id":1000,"result":"2014-12-31T09:36:47+09:00"}
```

## environments variable

- Broker address

**BROKER_ADDRESS**

- topic name of server

**SERVER_TOPIC_NAME**

- topic name of client

**CLIENT_TOPIC_NAME**

## Contributing

1. Fork it ( https://github.com/futoase/json_rpc_over_mqtt_example/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
