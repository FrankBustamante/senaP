class Report < ApplicationRecord
  belongs_to :branch_office
  belongs_to :user
  belongs_to :area, :through => :user
end
