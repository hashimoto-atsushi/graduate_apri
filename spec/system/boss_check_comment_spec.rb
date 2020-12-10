require 'rails_helper'
#カタログ設計 7
RSpec.describe '上長確認 登録管理機能', type: :system do

  before do
    FactoryBot.create(:sales_user)
    FactoryBot.create(:tech_user)
    FactoryBot.create(:boss_user)
    FactoryBot.create(:customer)
    FactoryBot.create(:product)
    FactoryBot.create(:installed_product)
    FactoryBot.create(:support_program)
    FactoryBot.create(:detail_report)
    ActionMailer::Base.deliveries.clear
    log_in
  end

  describe '上長確認 登録管理機能' do
    context '作業報告に対する上長確認を登録した場合' do
      it '関連部署にメールが送信され、登録した作業報告内容が登録され表示される' do
        visit detail_reports_path
        click_on '詳細'
        click_on '上長確認 登録へ'
        select '定期保守A', from: 'boss_check_comment[detail_report_id]'
        select '承認済', from: 'boss_check_comment[confirmation]'
        fill_in 'boss_check_comment_confirmation_date', with: '002021-11-26'
        fill_in 'boss_check_comment_positive_comment', with: '内容了解しました。安全に作業していただきありがとうございます。'
        fill_in 'boss_check_comment_negative_comment', with: '特にはありませんが、できるだけ早めに報告を上げていだけると幸いです。'
        fill_in 'boss_check_comment_assistance', with: 'この調子でよろしくお願いします。営業部には私から連絡しておきます。'
        fill_in 'boss_check_comment_questions', with: '電源ユニットの出力はだいぶ下がっていましたか？'
        fill_in 'boss_check_comment_report_to_sales', with: '営業部員テストさんへ、保守案件Aの作業が問題なく終了しました。お客様が今後のサポートに関してお話をされたいとのことです。一度、相談させてください。'
        click_on '登録する'
        click_on '登録する'
        expect(ActionMailer::Base.deliveries.first.from).to eq ['from@example.com']
        expect(ActionMailer::Base.deliveries.first.to).to eq ['sales@example.com']
        expect(ActionMailer::Base.deliveries.second.from).to eq ['from@example.com']
        expect(ActionMailer::Base.deliveries.second.to).to eq ['boss@example.com']
        visit top_index_path
        visit boss_check_comments_path
        click_on '詳細'
        expect(page).to have_content '内容了解しました。安全に作業していただきありがとうございます。'
        expect(page).to have_content '特にはありませんが、できるだけ早めに報告を上げていだけると幸いです。'
        expect(page).to have_content 'この調子でよろしくお願いします。営業部には私から連絡しておきます。'
        expect(page).to have_content '電源ユニットの出力はだいぶ下がっていましたか？'
        expect(page).to have_content '営業部員テストさんへ、保守案件Aの作業が問題なく終了しました。お客様が今後のサポートに関してお話をされたいとのことです。一度、相談させてください。'
      end
    end
  end
end

private
def log_in
  visit new_user_session_path
  fill_in 'user_employee_number', with: 4
  fill_in 'user_email', with: 'boss@example.com'
  fill_in 'user_password', with: 'testtest'
  click_on 'ログイン'
end
