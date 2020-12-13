FactoryBot.define do
  factory :installed_product do
    product_id { 1 }
    customer_id { 1 }
    serial_number { "12345678" }
    installed_date { "2012-12-12" }
    discount_price { 100 }
  end
end
