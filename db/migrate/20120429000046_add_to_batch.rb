class AddToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :host, :string
    add_column :batches, :processor, :string
    add_column :batches, :cores, :integer
  end
end
