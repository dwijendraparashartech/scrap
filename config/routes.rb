Rails.application.routes.draw do
  resources :items do 
  match '/scrape', to: 'items#scrape', via: :post, on: :collection
  end 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"
end