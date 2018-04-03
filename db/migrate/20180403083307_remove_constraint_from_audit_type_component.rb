class RemoveConstraintFromAuditTypeComponent < ActiveRecord::Migration[5.1]
  def change

    execute <<-SQL
      ALTER TABLE check_list_engine_audit_type_components DROP constraint fk_audit_type_component__available_component;
    SQL

    drop_table :check_list_engine_available_components

  end
end
