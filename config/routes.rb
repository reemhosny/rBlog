Rails.application.routes.draw do
  resources :users
  get 'contact'=>'contacts#new'
  get 'contacts/create'
  get 'about'=>'about#index'
  namespace :admin do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  end
  namespace :admin do
    get 'users/new'
    get 'users/create'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
    get 'users/show'
    get 'users/index'
    get 'users/show'
  end
  namespace :admin do
    get 'comments/destroy'
  end
  get 'comments/new'
  namespace :admin do
    get 'categories/new'
    get 'categories/create'
    get 'categories/edit'
    get 'categories/update'
    get 'categories/destroyshow'
    get 'categories/index'
    get 'categories/show'
  end
  get 'categories/show'
  namespace :admin do
    get 'posts/new'
    get 'posts/create'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroyshow'
    get 'posts/index'
    get 'posts/show'
  end
  get 'posts/index'
  get 'posts/show'
  get 'post/index'
  get 'post/show'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'


resources :posts, :categories
resources 'contacts',only:[:new,:create]
namespace :admin do
resources :posts, :categories,:users,:comments ,:sessions
  end
  
  resources :posts do
    resources :comments

  end
  root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


