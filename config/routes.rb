Rails.application.routes.draw do
  resources :check_out_records do
    collection do
      get :select_room, :action => :select_room
    end
  end
  resources :customers do
    collection do
      post :search_customer, :action => :search_customer
    end
  end
  resources :check_in_records
  resources :rooms do
    collection do
      get :available_rooms, :action => :available_rooms
    end
  end
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  resources :users

  root "rooms#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
