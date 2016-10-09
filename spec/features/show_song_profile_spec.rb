require 'rails_helper'

feature 'Show profile of a song' do
  scenario 'visitor sees song profile when clicking on video thumbnail' do
    expect(FetchVideoService).to receive(:method).and_return('view stats')
    #fabricate song 
    song = Fabricate(:song)

    #start at root path
    visit root_path

    # click on a thumbnail with class video_link
    find(:css, 'video_link').click
    find(a.video_link).click

    # expect to go to the show song profile page and see the video uid in the url OR the cached slug
    expect(page).to have_current_path('song/video_uid')
    expect(page).to have_current_path('song/cached_slug')

    # expect song content to be displayed on page 
    expect(find('*[data-test-id='myobj'])).to have_content('Something')
    expect(find('#song_title')).to have_content('Song Title')
    expect(find('#artist_title')).to have_content('Artist Title')
    expect(find('#city_title')).to have_content('City Title')
    expect(find('#video_views')).to have_content('Video views')
    expect(find('#video_likes')).to have_content('Video likes')
    expect(find('#video_dislikes')).to have_content('Video dislikes')
    expect(find('#video_favorites')).to have_content('Video favorites')
    expect(find('#video_comments')).to have_content('Video comments')
  end
end