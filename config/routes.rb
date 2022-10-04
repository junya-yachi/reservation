Rails.application.routes.draw do
  get 'rooms/registration'
  get 'mains/index'
  get 'rooms/index'
  get 'reserves/index'
  
  root :to => 'mains#index'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions'
}

  resources :rooms do
    collection do
      get 'search'
    end
  end

  resources :mains
  resources :rooms
  resources :reserves

  get 'search' => 'searches#search'
end
