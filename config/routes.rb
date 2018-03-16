CheckListEngine::Engine.routes.draw do

    #scope module: :check_list_engine do
        # Somehow need to tell that the class is in the CheckListEngine Module
          jsonapi_resources :audit_types
    #end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
