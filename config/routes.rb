Rails.application.routes.draw do
  get 'ingredient/name'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get "cocktails", to: "cocktails#index"
  # get "cocktails/new", to: "cocktails#new"
  # get "cocktails/:id", to:"cocktails#show", as: 'show'
  # post "cocktails", to: "cocktails#create", as: 'create'
  # get "cocktail/:id/edit", to: "cocktails#edit", as: 'edit'
  # patch "cocktails/:id", to: "cocktails#update", as: 'update'
  # delete "cocktails/:id", to: "cocktails#destroy", as: 'destroy'

  root to: 'cocktails#index'

  resources :cocktails do
    resources :doses, only: [ :new, :create ]
  end
  resources :doses, only: [:destroy]

end
