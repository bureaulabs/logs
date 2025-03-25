json.extract! log, :id, :url, :slug, :title, :caption, :category_id, :metadata_raw, :created_at, :updated_at
json.url log_url(log, format: :json)
