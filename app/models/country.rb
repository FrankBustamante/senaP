class Country < ApplicationRecord
  has_many :cities, :through => :department
end
