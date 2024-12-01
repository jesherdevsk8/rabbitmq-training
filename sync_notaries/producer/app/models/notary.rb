class Notary < ApplicationRecord
  has_many :notary_properties
  has_many :properties, through: :notary_properties

  # 10.times do
  #   notary = Notary.create!(name: Faker::Name.name)

  #   3.times do
  #     property = Property.create!(name: Faker::Company.name)
  #     NotaryProperty.create!(notary: notary, property: property)
  #   end
  # end

  def self.create_without_properties!
    5.times do
      create!(name: Faker::Company.name)
    end
  end
end
