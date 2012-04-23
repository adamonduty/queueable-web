class TestRun < ActiveRecord::Base
  attr_accessible :machine, :notes, :release, :sysname, :version
end
