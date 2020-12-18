FactoryBot.define do
  factory :sales_check_comment do
    boss_check_comment { nil }
    confirmation { false }
    confirmation_date { "2021-11-26" }
    comments { "MyText" }
    discussion_possibility { false }
    matter_closed { false }
  end
end
