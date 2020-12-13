FactoryBot.define do
  factory :admin_user, class: User do
    id {1}
    employee_number { 1 }
    name { "管理者テスト" }
    department { 2 }
    position { 2 }
    permission { true }
    email { "admin@example.com" }
    cellphone_number { "111222333" }
    stay_or_left { 0 }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
  factory :sales_user, class: User do
    id {2}
    employee_number { 2 }
    name { "営業部員テスト" }
    department { 0 }
    position { 2 }
    permission { false }
    email { "sales@example.com" }
    cellphone_number { "111222333" }
    stay_or_left { 0 }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
  factory :tech_user, class: User do
    id {3}
    employee_number { 3 }
    name { "技術部員テスト" }
    department { 1 }
    position { 2 }
    permission { false }
    email { "tech@example.com" }
    cellphone_number { "111222333" }
    stay_or_left { 0 }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
  factory :boss_user, class: User do
    id {4}
    employee_number { 4 }
    name { "部長" }
    department { 1 }
    position { 0 }
    permission { false }
    email { "boss@example.com" }
    cellphone_number { "111222333" }
    stay_or_left { 0 }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
end
