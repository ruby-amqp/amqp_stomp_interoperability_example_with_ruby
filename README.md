# AMQP and STOMP interoperability using Ruby and RabbitMQ STOMP plugin

This is an example of RabbitMQ STOMP plugin in action. It has two parts:

 * A Ruby STOMP producer that connects to default RabbitMQ STOP plugin endpoint and publishes a couple of hundred messages.
 * A Ruby AMQP consumer that subscribes to messages from STOMP producer.

## Libraries used

 * [Bunny](http://rubybunny.info)
 * [Ruby STOMP client](https://github.com/stompgem/stomp)

## Getting started

Pre-requisites are

 * Having a RabbitMQ 3.0+ installed. See [RabbitMQ installation guide](http://www.rabbitmq.com/install.html) and [downloads](http://www.rabbitmq.com/download.html). On Mac OS X we recommend using [Homebrew](http://mxcl.github.com/homebrew):

    brew install rabbitmq

 * Having a RabbitMQ STOMP plugin enabled. See [STOMP plugin docs](http://www.rabbitmq.com/stomp.html).

The install dependencies with Bundler:

    gem install bundler

and then, from Git repository root

    bundle install

Finally, run both scripts (in two shells), consumer first:

    bundle exec ruby ./script/amqp_consumer.rb

and then the producer

    bundle exec ruby ./script/stomp_producer.rb

## License

Copyright (c) 2011-2014, Michael S. Klishin

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
