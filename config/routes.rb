Rails.application.routes.draw do
  get 'polls/index'

  root 'polls#index'
end
