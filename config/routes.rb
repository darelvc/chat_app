Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
  
  resources 'chats' do
    resources :messages
  end
  
  get '*path' => redirect('/')
end
