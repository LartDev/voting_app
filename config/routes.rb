Rails.application.routes.draw do
  devise_for :users
  get 'polls/index'

  root 'polls#index'
end
