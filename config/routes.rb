CheckListEngine::Engine.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    jsonapi_resources :audit_type_components
    jsonapi_resources :available_component_types

    jsonapi_resources :audit_types do
      jsonapi_related_resources :audit_type_components
    end
  end

end
