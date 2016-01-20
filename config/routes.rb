Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
  
  resources 'chats'
  
  get '*path' => redirect('/')
=======
  get 'welcome/index'

  root 'welcome#index'
>>>>>>> 161f994d2cda39520c5f44efed35f46e51e4e5b2
end
