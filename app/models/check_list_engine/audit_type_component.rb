module CheckListEngine
  class AuditTypeComponent < ActiveRecord::Base

    belongs_to :audit_type
    belongs_to :available_component

    #validates :title, presence: true
    #validates :available_component_id, presence: true
  end
end
