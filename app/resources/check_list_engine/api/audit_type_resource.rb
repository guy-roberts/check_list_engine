module CheckListEngine
  module Api
    class AuditTypeResource < JSONAPI::Resource
      model_name 'CheckListEngine::AuditType'
      attributes :title

      has_many :audit_type_components
    end
  end
end
