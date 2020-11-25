json.extract! installed_product, :id, :product_id, :serial_number, :installed_date, :discount_price, :created_at, :updated_at
json.url installed_product_url(installed_product, format: :json)
