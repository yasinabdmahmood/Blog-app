Rails.application.routes.draw do
  root to: "users#index"
  get '/users/:id' , to: 'users#show'
  get '/users/:id/posts' , to: 'posts#index', as: 'posts'
  get '/users/:id/posts/new', to: 'posts#new', as: 'new_post'
  post '/users/:id/posts/create', to: 'posts#create', as: 'create_post'  
  get '/users/:id/posts/:post_id' , to: 'posts#show'
end
