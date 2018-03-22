CheckListEngine::Engine.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    # This resource is needed for json api resources to include it ! Exception was raised in engine_resource_url()
    jsonapi_resources :audit_type_components

    jsonapi_resources :audit_types do
      jsonapi_related_resources :audit_type_components
    end
  end

end
