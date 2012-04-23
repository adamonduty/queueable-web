class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :type
      t.integer :threads
      t.decimal :seconds
      t.integer :msg_size
      t.references :test_run

      t.timestamps
    end
    add_index :tests, :test_run_id
  end
end
