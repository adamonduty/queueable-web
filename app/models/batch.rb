class Batch < ActiveRecord::Base
  has_many :runs
  belongs_to :platform
  attr_accessible :notes
  attr_accessible :runs_attributes

  accepts_nested_attributes_for :runs
end
