require 'rails_helper'
#カタログ設計 3
RSpec.describe '保守案件情報 登録管理機能', type: :system do

  before do
    FactoryBot.create(:sales_user)
    FactoryBot.create(:tech_user)
    FactoryBot.create(:customer)
    FactoryBot.create(:product)
    log_in
  end

  describe '保守案件情報 登録管理機能' do
    context '保守案件を新規登録した場合' do
      it '登録した保守案件情報が登録され表示される' do
        visit support_programs_path
        visit new_support_program_path
        fill_in 'support_program_title_number', with: '1'
        select '顧客1', from: 'support_program[customer_id]'
        fill_in 'support_program_title', with: 'ちゃんとメンテしようね'
        select '技術部員', from: 'support_program[user_id]'
        fill_in 'support_program_main_work', with: '電源ユニット全交換作業'
        select '計画', from: 'support_program[planed_or_argent]'
        select '受注済', from: 'support_program[order_status]'

        fill_in 'support_program_kick_off_date', with: '002022-02-02'
        select '未完了', from: 'support_program[closed]'
        click_on '登録する'
        click_on '登録する'
        visit top_index_path
        visit support_programs_path
        click_on '詳細'
        expect(page).to have_content '顧客1'
        expect(page).to have_content 'ちゃんとメンテしようね'
        expect(page).to have_content '技術部員テスト'
        expect(page).to have_content '電源ユニット全交換'
        expect(page).to have_content '受注済'
      end
    end
  end
end

private
def log_in
  visit new_user_session_path
  fill_in 'user_employee_number', with: 3
  fill_in 'user_email', with: 'tech@example.com'
  fill_in 'user_password', with: 'testtest'
  click_on 'ログイン'
end
