FactoryBot.define do
  factory :product do
    name { "MyString" }
    type { "" }
    category { "MyString" }
    list_price { 1 }
    release_date { "2020-11-25" }
    end_of_production { "2020-11-25" }
    end_of_service { "2020-11-25" }
  end
end
