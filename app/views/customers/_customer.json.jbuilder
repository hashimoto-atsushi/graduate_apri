json.extract! customer, :id, :user_id, :customer_number, :name, :phone_number, :profession, :customer_in_charge, :department, :position, :created_at, :updated_at
json.url customer_url(customer, format: :json)
