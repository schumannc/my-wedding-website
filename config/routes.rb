Rails.application.routes.draw do

  root 'pages#home'
  get 'fotos', to: 'pages#fotos'
  get 'locais', to: 'pages#locais'
  get 'instagram', to: 'pages#instagram'
  get 'manutencao', to: 'pages#manutencao'

  get 'rsvp', to: 'confirmations#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
  get 'login/admin', to: 'sessions#index'
  get 'messages/:id/confirmado', to: 'messages#confirmar', as: 'confirmado'
  get 'messages/mais', to: 'messages#mais'
  
  
  post 'email_msgs', to: 'checkout#email_msgs'
  post 'sucesso', to: 'checkout#sucesso'
  post 'falha', to: 'checkout#falha'
  get 'sucesso', to: 'checkout#sucesso'
  get 'falha', to: 'checkout#falha'
  post 'notifications', to: 'notifications#create'
  get 'arrecadado', to: 'checkout#show'


  resources :messages
  resources :confirmations do
    member do 
      get :email
    end
  end

  resources :orders, controller: 'checkout'


  resources :presentes, param: :url, only: [:index, :show] do
     get ':line_item_id/order', to: 'checkout#index', as: 'order'
  end
  
end
