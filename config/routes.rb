CheckListEngine::Engine.routes.draw do

  namespace :api do
    scope :v1 do
      resources :audit_types do
        resources :audit_type_components
      end

      resources :available_components
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
