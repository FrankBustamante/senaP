class City < ApplicationRecord
  belongs_to :department
  has_many :branch_offices

  def description
    "#{self.name} #{self.department.name}"
  end
end
