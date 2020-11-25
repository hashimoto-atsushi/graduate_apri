FactoryBot.define do
  factory :installed_product do
    product { nil }
    serial_number { "MyString" }
    installed_date { "2020-11-25" }
    discount_price { 1 }
  end
end
