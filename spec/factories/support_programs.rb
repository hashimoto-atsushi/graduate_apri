FactoryBot.define do
  factory :support_program do
    customer { nil }
    user { nil }
    title_number { 1 }
    title { "MyString" }
    main_work { "MyText" }
    planed_or_argent { 1 }
    order_status { false }
    kick_off_date { "2020-11-26" }
    closed { 1 }
  end
end
