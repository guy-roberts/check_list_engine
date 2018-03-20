module CheckListEngine
  module Api
    class AuditTypeResource < JSONAPI::Resource
      model_name 'CheckListEngine::AuditType'
      attributes :title
    end
  end
end
