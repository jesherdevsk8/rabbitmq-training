class Property < ApplicationRecord
  has_many :notaries

  validates :erp_code, uniqueness: true
end
