Rails.application.routes.draw do
  devise_for :users
  root to: 'homepage#index'
  get '/en', to: 'homepage#en'
  get '/arab', to: 'homepage#arab'
end
