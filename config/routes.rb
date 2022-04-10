Rails.application.routes.draw do
  resources :projects do
    resources :todos
  end

  post '/todos' => 'todos#create'
  
end
