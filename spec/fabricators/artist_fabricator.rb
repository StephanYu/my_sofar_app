Fabricator(:artist) do
  songs(count: 2)   
  title      { Faker::Name.name }
  artist_uid { Faker::Number.number(4) }
end