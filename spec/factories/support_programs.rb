FactoryBot.define do
  factory :support_program do
    id { 1 }
    customer_id { 1 }
    user_id { 3 }
    title_number { 1 }
    title { "定期保守A" }
    main_work { "全ユニットオーバーホール" }
    planed_or_argent { 0 }
    order_status { true }
    kick_off_date { "2021-11-11" }
    closed { 1 }
  end
end
