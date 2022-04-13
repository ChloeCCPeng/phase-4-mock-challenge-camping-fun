Rails.application.routes.draw do
  get 'signups/create'
  get 'activities/index'
  get 'activities/destroy'
  get 'campers/index'
  get 'campers/show'
  get 'campers/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :campers, only: [:index, :show, :create]
resources :activities, only: [:index, :destroy]
resources :signups, only: [:create]
end
