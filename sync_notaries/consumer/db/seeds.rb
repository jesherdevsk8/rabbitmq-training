10.times do
  Property.create!(name: Faker::Company.name,
                   erp_code: Faker::Company.ein)
end
