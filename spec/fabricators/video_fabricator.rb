Fabricator(:video) do
  song
  video_uid { Faker::Number.number(4) }
end