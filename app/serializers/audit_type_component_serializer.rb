class AuditTypeComponentSerializer
  include FastJsonapi::ObjectSerializer

  set_type :audit_type_component
  attributes :position, :title, :help_text, :choices, :has_image, :is_mandatory

  has_one :available_component

end
