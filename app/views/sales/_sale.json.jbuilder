json.extract! sale, :id, :client_id, :user_id, :invoice_code, :created_at, :updated_at
json.url sale_url(sale, format: :json)
