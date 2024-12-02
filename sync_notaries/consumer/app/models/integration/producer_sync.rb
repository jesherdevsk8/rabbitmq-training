# frozen_string_literal: true

module Integration
  class ProducerSync
    # TODO: Refactor this method
    def self.process(data)
      return unless data.any?
      return unless (property = Property.find_by(erp_code: data[:property][:erp_code]))

      notary_attributes = data.slice!('id', 'name')
      property_attributes = property.attributes.slice!('id', 'name', 'erp_code')

      merged_attributes = notary_attributes.merge(property_attributes)

      rabbitmq = Integration::RabbitMQService.new
      rabbitmq.publish(merged_attributes.to_json)
    end
  end
end
