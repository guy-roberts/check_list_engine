module CheckListEngine
  module Api
    class AuditTypeComponentResource < JSONAPI::Resource
      model_name 'CheckListEngine::AuditTypeComponent'
      attributes :title

      has_one :audit_type
    end
  end
end
