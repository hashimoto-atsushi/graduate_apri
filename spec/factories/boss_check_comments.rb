FactoryBot.define do
  factory :boss_check_comment do
    id { 1 }
    detail_report_id { 1 }
    confirmation { true }
    confirmation_date { "2021-11-26" }
    positive_comment { "内容了解しました。安全に作業していただきありがとうございます。" }
    negative_comment { "特にはありませんが、できるだけ早めに報告を上げていだけると幸いです。" }
    assistance { "この調子でよろしくお願いします。営業部には私から連絡しておきます。" }
    questions { "電源ユニットの出力はだいぶ下がっていましたか？" }
    report_to_sales { "営業部員テストさんへ、保守案件Aの作業が問題なく終了しました。お客様が今後のサポートに関してお話をされたいとのことです。一度、相談させてください。" }
  end
end
