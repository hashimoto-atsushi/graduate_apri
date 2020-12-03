require 'rails_helper'

RSpec.describe '顧客管理機能', type: :system do

  before do
    FactoryBot.create(:admin_user)
    FactoryBot.create(:sales_user)
    log_in
  end

  describe '顧客情報 登録機能' do
    context '顧客情報を新規登録した場合' do
      it '登録した顧客名が表示される' do
        visit customers_path
        visit new_customer_path
        fill_in 'customer_customer_number', with: '1'
        fill_in 'customer_name', with: '顧客 甲乙'
        fill_in 'customer_profession', with: 'ハード開発'
        fill_in 'customer_customer_in_charge', with: '太郎'
        fill_in 'customer_department', with: '総務'
        fill_in 'customer_position', with: 'チーフ'
        fill_in 'customer_phone_number', with: '045045045'
        select '営業部員', from: 'customer[user_id]'
        click_on '登録する'
        click_on '登録する'
        visit top_index_path
        visit customers_path
        expect(page).to have_content '甲乙'
      end
    end
  end
end

private
def log_in
  visit new_user_session_path
  fill_in 'user_email', with: 'admin@example.com'
  fill_in 'user_password', with: 'testtest'
  click_on 'ログイン'
end
