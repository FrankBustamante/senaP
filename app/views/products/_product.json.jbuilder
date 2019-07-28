json.extract! product, :id, :name, :description, :product_line_id, :quantity, :price, :branch_office_id, :adjunto, :created_at, :updated_at
json.url product_url(product, format: :json)
