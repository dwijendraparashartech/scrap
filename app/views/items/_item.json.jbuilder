json.extract! item, :id, :name, :address, :description, :image_link, :website, :company_url, :founding_year, :created_at, :updated_at
json.url item_url(item, format: :json)
