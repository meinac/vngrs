Vngrs::Application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: :omniauth_callbacks}
  
  root 'home#index'

  resources :contacts do
    collection do
      get :import_xml
    end
  end

end
