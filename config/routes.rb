Rails.application.routes.draw do
  resources :daily_goals
  resources :goals
  resources :stores
  devise_for :users

	devise_scope :user do
	  root to: "devise/sessions#new"
	end
end
