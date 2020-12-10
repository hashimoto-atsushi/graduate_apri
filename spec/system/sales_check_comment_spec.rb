require 'rails_helper'
#カタログ設計 6
RSpec.describe '営業確認 登録管理機能', type: :system do

  before do
    FactoryBot.create(:sales_user)
    FactoryBot.create(:tech_user)
    FactoryBot.create(:boss_user)
    FactoryBot.create(:customer)
    FactoryBot.create(:product)
    FactoryBot.create(:installed_product)
    FactoryBot.create(:support_program)
    FactoryBot.create(:detail_report)
    FactoryBot.create(:boss_check_comment)
    ActionMailer::Base.deliveries.clear
    log_in
  end

  describe '営業確認 登録管理機能' do
    context '上長確認に対する営業確認を登録した場合' do
      it '関連部署にメールが送信され、営業確認内容が登録され表示される' do
        visit boss_check_comments_path
        click_on '詳細'
        click_on '営業担当 確認画面へ'
        select '定期保守A', from: 'sales_check_comment[boss_check_comment_id]'
        select '確認済', from: 'sales_check_comment[confirmation]'
        fill_in 'sales_check_comment_confirmation_date', with: '002021-11-28'
        fill_in 'sales_check_comment_comments', with: '連絡ありがとうございます。保守案件Aが無事終了してよかったです。明日あたり顧客1様にアポイントをとって挨拶してきます。ところで、サポート期限件に関しての打ち合わせ相談させてください。'
        select '有り', from: 'sales_check_comment[discussion_possibility]'
        select '承認済', from: 'sales_check_comment[matter_closed]'
        click_on '登録する'
        click_on '登録する'
        expect(ActionMailer::Base.deliveries.first.from).to eq ['from@example.com']
        expect(ActionMailer::Base.deliveries.first.to).to eq ['tech@example.com']
        expect(ActionMailer::Base.deliveries.second.from).to eq ['from@example.com']
        expect(ActionMailer::Base.deliveries.second.to).to eq ['boss@example.com']
        visit top_index_path
        visit sales_check_comments_path
        click_on '詳細'
        expect(page).to have_content '電源ユニット、ファンユニットをオーバーホール。各部清掃作業を実行しました。'
        expect(page).to have_content '問題無く全工程を終了'
        expect(page).to have_content '高評価'
        expect(page).to have_content 'お客様も安心して立ち会っていただき、最終動作も満足していただきました。'
        expect(page).to have_content '内容了解しました。安全に作業していただきありがとうございます。'
        expect(page).to have_content '特にはありませんが、できるだけ早めに報告を上げていだけると幸いです。'
        expect(page).to have_content 'この調子でよろしくお願いします。営業部には私から連絡しておきます。'
        expect(page).to have_content '電源ユニットの出力はだいぶ下がっていましたか？'
        expect(page).to have_content '営業部員テストさんへ、保守案件Aの作業が問題なく終了しました。お客様が今後のサポートに関してお話をされたいとのことです。一度、相談させてください。'
        expect(page).to have_content '連絡ありがとうございます。保守案件Aが無事終了してよかったです。明日あたり顧客1様にアポイントをとって挨拶してきます。ところで、サポート期限件に関しての打ち合わせ相談させてください。'
        expect(page).to have_content '承認済'
      end
    end
  end
end

private
def log_in
  visit new_user_session_path
  fill_in 'user_employee_number', with: 2
  fill_in 'user_email', with: 'sales@example.com'
  fill_in 'user_password', with: 'testtest'
  click_on 'ログイン'
end
