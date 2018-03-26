module CheckListEngine
  module Api
    class AvailableComponentResource < JSONAPI::Resource
      model_name 'CheckListEngine::AvailableComponent'

      attributes :title
    end
  end
end
