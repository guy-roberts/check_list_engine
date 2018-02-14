module CheckListEngine
  class AuditType < ApplicationRecord
    validates :title,    :presence => true, :uniqueness => true
  end
end
