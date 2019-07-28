class City < ApplicationRecord
  belongs_to :department
  has_many :branch_offices
end
