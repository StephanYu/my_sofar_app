Rails.application.routes.draw do
  
  root 'videos#index'
  get 'videos/:id/:cached_slug', to: 'videos#show', as: 'video'
  get 'videos/:id', to: 'videos#youtube', as: 'youtube'

end
