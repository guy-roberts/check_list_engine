class CreateCheckListEngineAuditTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :check_list_engine_audit_types do |t|
      t.string :title

      t.timestamps
    end
  end
end
