Vngrs::Application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: :omniauth_callbacks}
  
  root 'home#index'

end
