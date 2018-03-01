class AddConstraintToAuditTypeComponent < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      ALTER TABLE check_list_engine_audit_type_components ADD CONSTRAINT fk_audit_type_component__audit_type FOREIGN KEY (audit_type_id) references check_list_engine_audit_types(id);
      ALTER TABLE check_list_engine_audit_type_components ADD CONSTRAINT fk_audit_type_component__available_component FOREIGN KEY (available_component_id) references check_list_engine_available_components(id);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE check_list_engine_audit_type_components DROP constraint fk_audit_type_component__audit_type;
      ALTER TABLE check_list_engine_audit_type_components DROP constraint fk_audit_type_component__available_component;
    SQL
  end
end
