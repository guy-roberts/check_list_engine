module CheckListEngine
  class AuditTypeComponent < ApplicationRecord

    belongs_to :audit_type

    validates :title, presence: true
    validates :available_component_id, presence: true

  end
end
