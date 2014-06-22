Rails.application.routes.draw do
  
  root 'pages#index'
  get 'pages/about'

  resources :issues
  resources :maps

  resources :council_members

  resources :committees do
    resources :committee_members
  end

end
