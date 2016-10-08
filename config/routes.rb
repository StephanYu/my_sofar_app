Rails.application.routes.draw do
  
  root 'videos#index'
  get 'videos/:id/:cached_slug', to: 'videos#show', as: 'video'

end
