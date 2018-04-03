class RenameAvailableComponentId < ActiveRecord::Migration[5.1]
  def change
    rename_column :check_list_engine_audit_type_components, :available_component_id, :available_component_type_id
  end
end
