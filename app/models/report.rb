class Report < ApplicationRecord
  belongs_to :branch_office
  belongs_to :user
  has_one :area, :through => :user
end
