FactoryBot.define do
  factory :customer do
    user_id { nil }
    customer_number { 1 }
    name { "MyString" }
    phone_number { "MyString" }
    profession { "MyString" }
    customer_in_charge { "MyString" }
    department { "MyString" }
    position { "MyString" }
  end
end
