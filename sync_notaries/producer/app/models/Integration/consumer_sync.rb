# frozen_string_literal: true

module Integration
  module ConsumerSync
    def self.process(message)
      parsed_message = parse_message(message)

      notary_data = parsed_message[:notary]
      property_data = parsed_message[:property]

      notary = create_notary(notary_data)
      property = create_property(property_data)
      link_property_to_notary(notary, property)

      puts 'Successfully processed notary and property creation.'
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

    def self.create_property(data)
      Property.create!(data)
    end

    def self.link_property_to_notary(notary, property)
      PropertyNotary.create!(notary: notary, property: property)
    end
  end
end
