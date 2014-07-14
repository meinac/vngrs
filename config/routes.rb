Vngrs::Application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  
  root 'home#index'

  resources :contacts
  resources :imports, only: :none do
    collection do
      get :import_xml
      post :do_import_xml
      get :xml_import_errors
    end
  end

end
