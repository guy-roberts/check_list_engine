class CreateCheckListEngineAuditTypeComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :check_list_engine_audit_type_components do |t|
      t.string :title

      t.integer :audit_type_id
      t.string :help_text
      t.integer :position
      t.integer :available_component_id
      t.boolean :has_image
      t.string  :choices
      t.boolean :is_mandatory

      t.timestamps
    end
  end
end
