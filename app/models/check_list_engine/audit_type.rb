module CheckListEngine
  class AuditType < ActiveRecord::Base

    has_many :audit_type_components

    validates :title,    :presence => true, :uniqueness => true
  end
end
