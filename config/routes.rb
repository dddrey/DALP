Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
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

  get '/admin', to: redirect('/admin/tests')

  namespace :admin do
    root to: 'admin/tests#index'

    resources :tests
    resources :questions

  end
end
