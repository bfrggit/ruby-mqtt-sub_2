require "rubygems"
require "mqtt"

MQTT::Client.connect(
	:remote_host => "dime.smartamerica.io",
	:remote_port => 1883
) do |client|
	puts "Connected"

	client.get("iot-test/d/+/evt/+/json") do |topic, msg|
		puts "Got message '#{msg}' on topic '#{topic}'"
	end
end
