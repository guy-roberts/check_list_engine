module CheckListEngine
  module Api
    class AuditTypeComponentResource < JSONAPI::Resource
      model_name 'CheckListEngine::AuditTypeComponent'
      attributes :title, :position, :help_text, :has_image, :choices, :is_mandatory
      attribute :name_of_component_type

      has_one :audit_type
      has_one :available_component_type

      def name_of_component_type
        "#{@model.available_component_type.title}"
      end

      def self.sortable_fields(context)
        super + [:"position"]
      end
    end
  end
end
