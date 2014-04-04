#!/usr/bin/env ruby

Bundler.setup
require "Bunny"

puts "Using Bunny #{Bunny::VERSION}"

conn = Bunny.new
conn.start

ch   = conn.create_channel
q    = ch.queue("amqpgem_stomp_interoperability", durable: true)

q.subscribe(block: true) do |_, _, payload|
  puts "#{payload} => amqpgem_stomp_interoperability queue"
end
