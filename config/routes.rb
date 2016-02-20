Rails.application.routes.draw do
  
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"

  resources :events do
  end
  
  resources :restaurants do
  end

  resources :event_relationships, only: [:create, :destroy]
  resources :restaurant_relationships, only: [:create, :destroy]

end
