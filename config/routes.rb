Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

get '/', to: 'top#index'
get '/login', to: 'top#login'

end

