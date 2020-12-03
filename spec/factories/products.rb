FactoryBot.define do
  factory :product do
    name { "製品おひつじ" }
    type_name { "ZZZ" }
    category { "部品" }
    list_price { 1980 }
    release_date { "2020-11-25" }
    end_of_production { "2020-11-25" }
    end_of_service { "2020-11-25" }
  end
end
