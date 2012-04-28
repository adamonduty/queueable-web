class AddUhashToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :uhash, :string
  end
end
