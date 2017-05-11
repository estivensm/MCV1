json.extract! source_parent, :id, :name, :description, :user_id, :admin_user, :codigo, :tipo, :created_at, :updated_at
json.url source_parent_url(source_parent, format: :json)