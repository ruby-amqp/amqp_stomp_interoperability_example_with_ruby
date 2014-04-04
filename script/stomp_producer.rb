#!/usr/bin/env ruby

# This example is derived from stomp gem repository and is licensed under
# Apache 2.0 license.
#
# See http://gitorious.org/stomp


Bundler.setup
require 'stomp'

client = Stomp::Client.new("stomp://guest:guest@localhost:61613")
message = ARGV[0] || "A sample message"

300.times do |i|
  client.publish("/queue/amqpgem_stomp_interoperability", "#{i}: #{message}")
  puts "(#{Time.now}) Messages sent: #{i}"
end



