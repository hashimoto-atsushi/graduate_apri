FactoryBot.define do
  factory :boss_check_comment do
    detail_report { nil }
    confirmation { false }
    confirmation_date { "2020-11-26" }
    positive_comment { "MyText" }
    negative_comment { "MyText" }
    assistance { "MyText" }
    questions { "MyText" }
    report_to_sales { "MyText" }
  end
end
