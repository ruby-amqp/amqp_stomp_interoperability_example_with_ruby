#!/usr/bin/env ruby

Bundler.setup
require "amqp"

puts "Using AMQP gem #{AMQP::VERSION}"

AMQP.start do |session|
  q = AMQP.channel.queue("amqpgem_stomp_interoperability", :durable => true)
  q.subscribe do |header, payload|
    puts "#{payload} => amqpgem_stomp_interoperability queue"
  end


  show_stopper = Proc.new {
    q.delete
    session.close do
      EventMachine.stop
    end
  }

  Signal.trap "TERM", &show_stopper
  Signal.trap "INT",  &show_stopper
end