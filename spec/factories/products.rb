FactoryBot.define do
  factory :product do
    id { 1 }
    name { "製品おひつじ" }
    type_name { "ZZZ" }
    category { "部品" }
    list_price { 1980 }
    release_date { "2021-12-12" }
    end_of_production { "2025-05-05" }
    end_of_service { "2027-07-07" }
  end
end
