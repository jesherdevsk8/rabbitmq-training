# frozen_string_literal: true

module Integration
  class RabbitMQService
    def initialize
      @client = Bunny.new(
        host: ENV.fetch('RABBITMQ_HOST', 'rabbitmq'),
        username: ENV.fetch('RABBITMQ_USER', 'admin'),
        password: ENV.fetch('RABBITMQ_PASSWORD', 'admin'),
        port: ENV['RAILS_ENV'] == 'production' ? 5671 : 5672,
        vhost: '/'
      )
    end

    def start
      @client.start
      @channel = @client.create_channel
    end

    def subscribe(queue_name, &)
      queue = @channel.queue(queue_name, durable: true)
      queue.subscribe(block: false, &)
    rescue Interrupt
      close
      exit(0)
    end

    def close
      @client.close
    end
  end
end
