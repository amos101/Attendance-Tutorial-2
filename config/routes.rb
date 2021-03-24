Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  get '/update_basic_info', to: 'users#update_basic_info'
  
  get    'users/:id/edit', to:  'users#edit'
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month' 
      patch 'attendances/update_one_month' 
    end
    resources :attendances, only: :update  
  end
end