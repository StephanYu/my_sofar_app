Fabricator(:video) do
  song
  thumb_url { Faker::Internet.url }
  video_uid { Faker::Number.number(4) }
end