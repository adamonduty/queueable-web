class CreateTestRuns < ActiveRecord::Migration
  def change
    create_table :test_runs do |t|
      t.string :sysname
      t.string :release
      t.string :version
      t.string :machine
      t.string :notes

      t.timestamps
    end
  end
end
