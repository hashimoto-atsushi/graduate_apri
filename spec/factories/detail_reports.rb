FactoryBot.define do
  factory :detail_report do
    support_program { nil }
    ordered_date { "2020-11-26" }
    ordered_price { 1 }
    actuall_kickoff_date { "2020-11-26" }
    actual_complete_date { "2020-11-26" }
    service_detail { "MyText" }
    photo { "MyText" }
    results { "MyText" }
    evaluation { 1 }
    evaluation_details { "MyText" }
  end
end
