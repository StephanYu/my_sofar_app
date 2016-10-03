require 'aws'

describe 'AWS' do 
  it 'successfully downloads a json file' do 
    aws_service = double("AWS", :download => {"key": "value"} )
   
    expect(aws_service.download).to eq({"key": "value"})
  end
end
