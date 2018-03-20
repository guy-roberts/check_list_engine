module CheckListEngine
  module Api
    class AuditTypeComponentResource < JSONAPI::Resource
      model_name 'CheckListEngine::AuditTypeComponent'
      attributes :title, :help_text, :position, :has_image, :available_component_id, :choices, :is_mandatory
      has_one :audit_type
    end
  end
end
