class Test < ActiveRecord::Base
  belongs_to :test_run
  attr_accessible :msg_size, :seconds, :threads, :type
end
