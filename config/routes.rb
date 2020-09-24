Rails.application.routes.draw do
  # devise_for :users
  root to: 'homepage#index'
  get '/en', to: 'homepage#en'
  get '/arab', to: 'homepage#arab'

  get '/registration', to: 'registration#new'
  get '/registration/success', to: 'registration#success'
  post '/registration', to: 'registration#create'

  get 'test', to: 'test#test'
end
