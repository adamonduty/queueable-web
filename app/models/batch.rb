class Batch < ActiveRecord::Base
  has_many :runs
  belongs_to :platform
  default_scope order('created_at DESC')
  attr_accessible :notes, :uhash, :host, :cores, :processor
  attr_accessible :runs_attributes

  accepts_nested_attributes_for :runs

  class << self
    def recent
      order('created_at DESC').limit(20)
    end
  end

  def backends
    runs.select(:backend).uniq.pluck(:backend)
  end

  def threads
    runs.select(:threads).uniq.pluck(:threads)
  end
end
