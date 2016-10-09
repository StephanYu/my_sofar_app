require 'rails_helper'

describe 'Display of songs' do
  it 'shows all songs to songs#index' do
    get songs_path
    expect(response).to render_template(:index)
  end
end