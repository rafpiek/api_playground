require 'sidekiq/web'

Rails.application.routes.draw do
authenticate :admin do 
 mount Sidekiq::Web => '/sidekiq'
 end 

  root 'root#index'
  get 'root/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
