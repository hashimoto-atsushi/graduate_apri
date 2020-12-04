FactoryBot.define do
  factory :detail_report do
    id { 1 }
    support_program_id { 1 }
    ordered_date { "2021-11-11" }
    ordered_price { 30000 }
    actual_kickoff_date { "2021-11-15" }
    actual_complete_date { "2020-11-25" }
    service_detail { "電源ユニット、ファンユニットをオーバーホール。各部清掃作業を実行しました。" }
    results { "問題無く全工程を終了" }
    evaluation { 0 }
    evaluation_details { "お客様も安心して立ち会っていただき、最終動作も満足していただきました。一点だけ質問があり、今後のサポート期間に関して、変更があればお伝えくださいとの事です。
      一度、営業部と相談させてください。" }
  end
end
