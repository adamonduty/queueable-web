class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :notes
      t.references :platform

      t.timestamps
    end
    add_index :batches, :platform_id
  end
end
