Fabricator(:city) do
  songs(count:2)
  title    { Faker::Address.city }
  city_uid { Faker::Number.number(4) }
end