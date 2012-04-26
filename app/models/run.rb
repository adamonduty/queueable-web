class Run < ActiveRecord::Base
  belongs_to :batch
  attr_accessible :backend, :msg_size, :seconds, :threads
end
