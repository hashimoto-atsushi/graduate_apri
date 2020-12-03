FactoryBot.define do
  factory :customer do
    user_id { 2 }
    customer_number { 1 }
    name { "顧客1" }
    phone_number { "111111111" }
    profession { "鼠" }
    customer_in_charge { "ご担当A" }
    department { "部署A" }
    position { "チーフ" }
  end
end
