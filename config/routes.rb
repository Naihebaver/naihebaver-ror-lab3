Rails.application.routes.draw do

  
  get 'images/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "pages#index"


  resources :posts do
  	resources :postcomments
  end

  resources :photos do
    member do
      get :vote
    end
  end
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
