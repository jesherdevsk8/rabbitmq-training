# frozen_string_literal: true

module Integration
  class ConsumerSync
    def self.process(message)
      parsed_message = parse_message(message)

      notary_data = parsed_message[:notary]

      create_notary(notary_data)

      puts 'Successfully processed notary creation.'
    rescue StandardError => e
      Rails.logger.error("Error processing message: #{e.message}")
      raise
    end

    def self.parse_message(message)
      JSON.parse(message, symbolize_names: true)
    rescue JSON::ParserError => e
      Rails.logger.error("Invalid JSON format: #{e.message}")
      raise ArgumentError, 'Message must be a valid JSON string.'
    end

    def self.create_notary(data)
      Notary.create!(data)
    end
  end
end
