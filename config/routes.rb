Rails.application.routes.draw do
  
  resources :daily_goals
  resources :goals
  resources :stores
  devise_for :users
end
