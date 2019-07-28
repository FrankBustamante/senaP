class Product < ApplicationRecord
  belongs_to :product_line
  belongs_to :branch_office
end
