require 'bunny'

class Consumer
  def initialize
    @connection = Bunny.new
    @connection.start
    @channel = @connection.create_channel
    @queue = @channel.queue('your_queue_name', durable: true)
  end

  def consume
    puts "Waiting for messages in #{@queue.name}. To exit press CTRL+C"
    @queue.subscribe(block: true) do |_delivery_info, _properties, body|
      puts "Received #{body}"
      # process the message here
    end
  rescue Interrupt => _e
    @channel.close
    @connection.close
    puts 'Connection closed'
  end
end

consumer = Consumer.new
consumer.consume
