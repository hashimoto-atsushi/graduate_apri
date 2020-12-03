FactoryBot.define do
  factory :product do
    name { "製品おひつじ" }
    type_name { "ZZZ" }
    category { "部品" }
    list_price { 1980 }
    release_date { "2012-12-12" }
    end_of_production { "2025-05-05" }
    end_of_service { "2027-07-07" }
  end
end
