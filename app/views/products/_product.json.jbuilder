json.extract! product, :id, :name, :type, :category, :list_price, :release_date, :end_of_production, :end_of_service, :created_at, :updated_at
json.url product_url(product, format: :json)
