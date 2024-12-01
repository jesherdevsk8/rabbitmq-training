class PropertyNotary < ApplicationRecord
  belongs_to :notary
  belongs_to :property
end
