require "rubygems"
require "mqtt"

MQTT::Client.connect(
	:remote_host => "dime.smartamerica.io",
	:remote_port => 1883
) do |client|
	puts "Connected"

	client.get("iot-1/d/+/evt/seismic/json") do |topic, msg|
		puts "Got message '#{msg}' on topic '#{topic}'"
	end
end
