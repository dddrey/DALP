Rails.application.routes.draw do
  devise_for :experts, controllers: {
    sessions: 'expert/sessions'
  }

  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :users, only: []
  root to: 'homepage#index'
  get '/en', to: 'homepage#en'
  get '/arab', to: 'homepage#arab'
  get '/second_stage_results', to: 'homepage#second_stage_results'
  get '/finalists', to: 'homepage#finalists'

  get '/registration', to: 'registration#new'
  get '/registration/finished', to: 'registration#finished'
  get '/registration/before', to: 'registration#before'
  post '/registration', to: 'registration#create'

  get '/test', to: 'test#test'
  get '/test/finished', to: 'test#finished'
  put '/test/submit_answer', to: 'test#submit_answer'

  get 'interview', to: 'interview#index'
  get 'interview/sign_up', to: 'interview#sign_up'
  post 'interview/sign_up', to: 'interview#create'

  get '/expert/dashboard', to: 'experts#dashboard'
  get '/expert/interviews/:id', to: 'experts#interview_page'
  put '/expert/interviews/:id', to: 'experts#submit_review'

  get '/questions/:id', to: 'test#question_preview'

  get '/admin', to: redirect('/admin/tests')

  namespace :admin do
    root to: 'admin/tests#index'

    resources :tests
    resources :users do
      get :test, on: :member, to: 'users#test'
      delete :interview_reset, on: :member, to: 'users#interview_reset'
    end
    resources :questions
    resources :experts, only: [:index, :show]
  end
end
