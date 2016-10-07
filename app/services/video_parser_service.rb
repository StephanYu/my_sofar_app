class VideoParserService

  def self.get_videos(file)
    AWS.download(file)
  end

  def self.get_thumbnail(video)

  end

end