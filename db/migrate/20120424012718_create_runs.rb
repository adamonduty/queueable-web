class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :backend
      t.integer :threads
      t.decimal :seconds
      t.integer :msg_size
      t.references :batch

      t.timestamps
    end
    add_index :runs, :batch_id
  end
end
