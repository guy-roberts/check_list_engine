module CheckListEngine
  class AuditTypeComponentResource < JSONAPI::Resource
    attributes :title, :help_text, :position, :has_image, :available_component_id, :choices, :is_mandatory
    has_one :audit_type
  end
end

