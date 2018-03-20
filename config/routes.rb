CheckListEngine::Engine.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    jsonapi_resources :audit_types
  end

end
