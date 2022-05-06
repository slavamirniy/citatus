Rails.application.routes.draw do
  get 'session/new'
  get 'users/new'
  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get    'login'   => 'session#new'
  post   'login'   => 'session#create'
  delete 'logout'  => 'session#destroy'
  get 'logout' => 'session#destroy'
  

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :quoutes, only: [:create, :destroy, :show]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

end