Rails.application.routes.draw do
  root 'cocktails#index'
  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
end


#/cocktails/:cocktail_id/doses/new
