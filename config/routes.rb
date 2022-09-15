Rails.application.routes.draw do
  get 'rooms/index'
  get 'mains/index'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions'
}

  resources :mains
  resources :rooms
end
