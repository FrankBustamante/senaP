class BranchOffice < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :areas
  has_many :users, :through => :areas
  has_many :products
  has_many :reports
  has_many :sales, :through => :user
end
