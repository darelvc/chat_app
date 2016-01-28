Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  
  get 'welcome/index'

  root 'welcome#index'
  
  resources 'chats' do
    resources :messages
  end
  
  get '*path' => redirect('/')
end
