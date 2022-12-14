Rails.application.routes.draw do
  devise_for :users
  root to: "users#index", as: 'users'
  get '/users/:id' , to: 'users#show', as: 'user'
  get '/users/:id/posts' , to: 'posts#index', as: 'posts'
  get '/users/:id/posts/new', to: 'posts#new', as: 'new_post'
  post '/users/:id/posts/create', to: 'posts#create', as: 'create_post'  
  get '/users/:id/posts/:post_id/new_comment' , to: 'comments#new', as:'new_comment'
  get '/users/:id/posts/:post_id' , to: 'posts#show', as: 'user_post'
  post '/users/:id/posts/:post_id/create' , to: 'comments#create', as: 'create_comment'
  post '/users/:id/posts/:post_id/create_like' , to: 'likes#create', as: 'create_like'
  
end
