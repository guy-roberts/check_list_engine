module CheckListEngine
  class AuditType < ApplicationRecord

    has_many :audit_type_components

    validates :title,    :presence => true, :uniqueness => true
  end
end
