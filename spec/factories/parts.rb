FactoryBot.define do
  factory :part do
    detail_report { nil }
    name { "MyString" }
    type_name { "MyString" }
    category { "MyString" }
    list_price { 1 }
    stock { 1 }
    release_date { "2021-11-25" }
    end_of_production { "2021-11-25" }
    end_of_service { "2021-11-25" }
  end
end
