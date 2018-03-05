class AuditTypeSerializer
 include FastJsonapi::ObjectSerializer

 set_type :audit_type
 attributes :title

 has_many :audit_type_components
end

