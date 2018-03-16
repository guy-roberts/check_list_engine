module CheckListEngine
  class AuditTypeResource < JSONAPI::Resource
    attributes :title
    #has_many :audit_type_components
  end
end
