require 'bunny'

module Producer
  class RabbitMQService
    def initialize
      @connection = Bunny.new
      @connection.start
      @channel = @connection.create_channel
      @exchange = @channel.direct('producer_exchange')
      @queue = @channel.queue('producer_queue', durable: true)
      @queue.bind(@exchange, routing_key: 'producer_key')
    end

    def publish(message)
      @exchange.publish(message, routing_key: 'producer_key')
    end

    def subscribe
      @queue.subscribe do |_delivery_info, _properties, body|
        Thread.new do
          puts "Received #{body}"
          sleep 1
          puts 'Processing...'
          sleep 1
          puts 'Done!'
        end
      end
    end
  end
end
