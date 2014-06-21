Rails.application.routes.draw do
  resources :council_members

  resources :committees do
    resources :committee_members
  end

  resources :issues
end
