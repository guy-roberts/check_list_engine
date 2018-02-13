Rails.application.routes.draw do
  mount CheckListEngine::Engine => "/check_list_engine"
end
