require 'rails_helper'
#カタログ設計 4 & 5
RSpec.describe '作業報告 登録管理機能', type: :system do

  before do
    FactoryBot.create(:sales_user)
    FactoryBot.create(:tech_user)
    FactoryBot.create(:boss_user)
    FactoryBot.create(:customer)
    FactoryBot.create(:product)
    FactoryBot.create(:installed_product)
    FactoryBot.create(:support_program)
    log_in
  end

  after(:all) do
    ActionMailer::Base.deliveries.clear
  end

  describe '作業報告 登録管理機能' do
    context '作業報告を登録した場合' do
      it '関連部署にメールが送信され、登録した作業報告内容が登録され表示される' do
        visit support_programs_path
        click_on '詳細'
        click_on '作業報告登録へ'
        select '定期保守A', from: 'detail_report[support_program_id]'
        select '2020', from: 'detail_report[ordered_date(1i)]'
        select '1月', from: 'detail_report[ordered_date(2i)]'
        select '1', from: 'detail_report[ordered_date(3i)]'
        fill_in 'detail_report_ordered_price', with: '20000'
        select '2020', from: 'detail_report[actual_kickoff_date(1i)]'
        select '5月', from: 'detail_report[actual_kickoff_date(2i)]'
        select '5', from: 'detail_report[actual_kickoff_date(3i)]'
        select '2020', from: 'detail_report[actual_complete_date(1i)]'
        select '5月', from: 'detail_report[actual_complete_date(2i)]'
        select '10', from: 'detail_report[actual_complete_date(3i)]'
        fill_in 'detail_report_service_detail', with: '電源ユニット、ファンユニットをオーバーホール。各部清掃作業を実行しました。'
        fill_in 'detail_report_results', with: '問題無く全工程を終了'
        select '高評価', from: 'detail_report[evaluation]'
        fill_in 'detail_report_evaluation_details', with: 'お客様も安心して立ち会っていただき、最終動作も満足していただきました。'
        click_on '登録する'
        click_on '登録する'
        expect(ActionMailer::Base.deliveries.first.from).to eq ['from@example.com']
        expect(ActionMailer::Base.deliveries.first.to).to eq ['sales@example.com']
        expect(ActionMailer::Base.deliveries.second.from).to eq ['from@example.com']
        expect(ActionMailer::Base.deliveries.second.to).to eq ['tech@example.com']
        expect(ActionMailer::Base.deliveries.third.from).to eq ['from@example.com']
        expect(ActionMailer::Base.deliveries.third.to).to eq ['boss@example.com']
        visit top_index_path
        visit detail_reports_path
        expect(page).to have_content '電源ユニット、ファンユニットをオーバーホール。各部清掃作業を実行しました。'
        expect(page).to have_content '問題無く全工程を終了'
        expect(page).to have_content '高評価'
        expect(page).to have_content 'お客様も安心して立ち会っていただき、最終動作も満足していただきました。'
      end
    end
  end
end

private
def log_in
  visit new_user_session_path
  fill_in 'user_email', with: 'tech@example.com'
  fill_in 'user_password', with: 'testtest'
  click_on 'ログイン'
end
