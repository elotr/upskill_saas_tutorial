Rails.application.routes.draw do
  root to: 'pages#home'
  get 'meist', to: 'pages#meist'
  resources :contacts, only: :create
  get 'kontakt', to: 'contacts#new', as: 'new_contact'
end
