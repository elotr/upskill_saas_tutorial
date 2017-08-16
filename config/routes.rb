Rails.application.routes.draw do
  root to: 'pages#home'
  get 'meist', to: 'pages#meist'
  resources :contacts
end
