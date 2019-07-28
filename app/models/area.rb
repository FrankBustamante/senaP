class Area < ApplicationRecord
  belongs_to :branch_office
  has_many :users
end
