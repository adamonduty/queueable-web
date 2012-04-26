class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :sysname
      t.string :release
      t.string :version
      t.string :machine

      t.timestamps
    end
  end
end
