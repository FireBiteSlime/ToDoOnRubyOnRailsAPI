Rails.application.routes.draw do
  resources :projects do
    resources :todos
  end
  get '/' => 'main#index'

  post 'main/update' => 'main#update'

  post 'main/create' => 'main#create'
  
end
