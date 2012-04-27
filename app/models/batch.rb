class Batch < ActiveRecord::Base
  has_many :runs
  belongs_to :platform
  attr_accessible :notes
  attr_accessible :runs_attributes

  accepts_nested_attributes_for :runs

  class << self
    def recent
      order('created_at DESC').limit(5)
    end
  end

  def backends
    runs.select(:backend).uniq.pluck(:backend)
  end
end
