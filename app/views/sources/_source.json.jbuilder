json.extract! source, :id, :name, :description, :user_id, :admin_user, :state, :created_at, :updated_at
json.url source_url(source, format: :json)