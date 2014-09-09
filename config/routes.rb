Rails.application.routes.draw do

  resources :event_attendees

  resources :events

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :users

  root  'pages#index'
  get   'pages/about'
  get   'pages/process_steps'
  get   'pages/calendar'
  post  'geocoder/search'

  resources :issues
  resources :maps
  resources :council_members
  resources :subscriptions, only: :create

  resources :committees do
    resources :committee_members
  end

end
