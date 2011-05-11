#!/usr/bin/env ruby

# This example is derived from stomp gem repository and is licensed under
# Apache 2.0 license.
#
# See http://gitorious.org/stomp


Bundler.setup
require 'stomp'

client = Stomp::Client.new("failover://(stomp://guest:guest@localhost:61613,stomp://:@remotehost:61613)?initialReconnectDelay=5000&randomize=false&useExponentialBackOff=false")
message = ARGV[0] || "A sample message"

300.times do |i|
  puts "Sending message"
  client.publish("/queue/amqpgem_stomp_interoperability", "#{i}: #{message}", { :persistent => true })
  puts "(#{Time.now}) Message sent: #{i}"
  sleep 1
end



