json.extract! page_document, :id, :name, :description, :user_id, :admin_user, :file, :created_at, :updated_at
json.url page_document_url(page_document, format: :json)