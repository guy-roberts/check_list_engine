CheckListEngine::Engine.routes.draw do

  namespace :api do
    scope :v1 do
      resources :audit_types
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
