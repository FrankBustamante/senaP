json.extract! report, :id, :type, :description, :adjunto, :branch_office_id, :user_id, :created_at, :updated_at
json.url report_url(report, format: :json)
