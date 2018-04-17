module CheckListEngine
  module Api
    class AvailableComponentTypeResource < JSONAPI::Resource
      model_name 'CheckListEngine::AvailableComponentType'

      attributes :title, :has_photo

      filters :title
    end
  end
end
