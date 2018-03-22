module CheckListEngine
  module Api
    class AuditTypeComponentResource < JSONAPI::Resource
      model_name 'CheckListEngine::AuditTypeComponent'
      attributes :title, :position, :help_text, :has_image, :choices, :is_mandatory

      has_one :audit_type

      def self.sortable_fields(context)
        super + [:"position"]
      end
    end
  end
end
