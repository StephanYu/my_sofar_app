class AWS
  include HTTParty
  
  base_uri 'https://s3-eu-west-1.amazonaws.com'
  format :json
  
  def self.download file
    get("/sofar-eu-1/#{file}")
  end
end