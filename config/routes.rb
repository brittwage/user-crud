PgAuth::Application.routes.draw do
  resources :users
  devise_for :users, :skip => [:registrations, :sessions]
  as :user do
    get "/login" => "devise/sessions#new", :as => :new_user_session
    post "/login" => "devise/sessions#create", :as => :user_session
    delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  # get "home/index" # TODO maybe this is necessary
  root :to => 'home#index'
end
