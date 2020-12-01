Rails.application.routes.draw do
  devise_for :experts

  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :users, only: []
  root to: 'homepage#index'
  get '/en', to: 'homepage#en'
  get '/arab', to: 'homepage#arab'

  get '/registration', to: 'registration#new'
  get '/registration/finished', to: 'registration#finished'
  get '/registration/before', to: 'registration#before'
  post '/registration', to: 'registration#create'

  get '/test', to: 'test#test'
  get '/test/finished', to: 'test#finished'
  put '/test/submit_answer', to: 'test#submit_answer'

  get '/questions/:id', to: 'test#question_preview'

  get '/admin', to: redirect('/admin/tests')

  namespace :admin do
    root to: 'admin/tests#index'

    resources :tests
    resources :users do
      get :test, on: :member, to: 'users#test'
    end
    resources :questions

  end
end
