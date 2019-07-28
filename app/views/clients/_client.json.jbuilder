json.extract! client, :id, :full_name, :telephone, :address, :identification, :created_at, :updated_at
json.url client_url(client, format: :json)
