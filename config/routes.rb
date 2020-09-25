Rails.application.routes.draw do
  # devise_for :users
  root to: 'homepage#index'
  get '/en', to: 'homepage#en'
  get '/arab', to: 'homepage#arab'

  get '/registration', to: 'registration#new'
  get '/registration/finished', to: 'registration#finished'
  get '/registration/before', to: 'registration#before'
  post '/registration', to: 'registration#create'

  get '/test', to: 'test#test'
  get '/test/finished', to: 'test#finished'

  namespace :admin do
    root to: 'admin/tests#index'

    resources :tests

  end
end
