Rails.application.routes.draw do
  
  resources :issues
  resources :maps

  resources :council_members

  resources :committees do
    resources :committee_members
  end

end
