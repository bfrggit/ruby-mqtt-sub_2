require "rubygems"
require "mqtt"

def sub_dime(topic)
	puts "Subscriber starting..."
	begin
		MQTT::Client.connect(
			:remote_host => "mqtt2.m2m4connectedlife.com",
			:remote_port => 1883
		) do |client|
			puts "Connected"

			client.get(topic) do |topic, msg|
				puts "Got message '#{msg}' on topic '#{topic}'"
			end
		end
	rescue Interrupt
		puts
	rescue SocketError
		puts "Connection failed."
	ensure
		puts "Subscriber terminated."
	end
end
