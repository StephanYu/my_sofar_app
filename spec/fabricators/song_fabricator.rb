Fabricator(:song) do
  artist   
  city     
  video    
  title    { Faker::Name.title }
  song_uid { Faker::Number.number(4) }
end