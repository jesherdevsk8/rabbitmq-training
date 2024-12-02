class Notary < ApplicationRecord
  belongs_to :property

  after_save :sync_with_producer

  def sync_with_producer
    Integration::ProducerSync.process(self.attributes) if property
  end
end
