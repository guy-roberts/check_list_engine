module CheckListEngine
  module Api
    class AvailableComponentTypeResource < JSONAPI::Resource
      model_name 'CheckListEngine::AvailableComponent'

      attributes :title, :has_photo
    end
  end
end
