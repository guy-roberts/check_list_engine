module CheckListEngine
    class AuditType < ActiveRecord::Base
      validates :title,    :presence => true, :uniqueness => true
    end
end

