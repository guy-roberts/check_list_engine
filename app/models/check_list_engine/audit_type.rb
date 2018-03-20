module CheckListEngine
  class AuditType < ActiveRecord::Base
    validates :title,    :presence => true, :uniqueness => true

    has_many :audit_type_components
  end
end

