require 'bunny'

begin
  rabbitmq = Integration::RabbitMQService.new
  rabbitmq.start

  queue_name = ENV.fetch('RABBITMQ_QUEUE_HUB', nil, durable: true)

  rabbitmq.subscribe(queue_name) do |_delivery_info, _properties, body|
    Integration::ConsumerSync.process(body)
  end
rescue StandardError => e
  Rails.logger.error("Erro no RabbitMQ: #{e.message}")
end
