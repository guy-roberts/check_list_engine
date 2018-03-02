class AuditTypeComponentSerializer
  include FastJsonapi::ObjectSerializer

  set_type :audit_type_component
  attributes :position, :title, :help_text
end
