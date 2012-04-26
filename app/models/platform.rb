class Platform < ActiveRecord::Base
  has_many :batches
  attr_accessible :machine, :release, :sysname, :version
  attr_accessible :batches_attributes

  accepts_nested_attributes_for :batches
  before_save :merge_duplicate

  def merge_duplicate
    dup = self.class.where(:machine => machine).where(:release => release).
            where(:sysname => sysname).where(:version => version).
            limit(1).first

    if dup
      self.id = dup.id
      @new_record = false
    end
    true
  end

end
