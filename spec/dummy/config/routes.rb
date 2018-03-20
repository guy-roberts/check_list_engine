Rails.application.routes.draw do
  mount CheckListEngine::Engine, at: '/check_lists'
end
