class CreateCheckListEngineAvailableComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :check_list_engine_available_components do |t|
      t.string :title
      t.string :has_photo

      t.timestamps
    end
  end
end
