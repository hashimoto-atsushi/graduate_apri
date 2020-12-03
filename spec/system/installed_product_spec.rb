require 'rails_helper'
#カタログ設計 1 & 2
RSpec.describe '納入機器 管理機能', type: :system do

  before do
    FactoryBot.create(:sales_user)
    FactoryBot.create(:customer)
    FactoryBot.create(:product)
    log_in
  end

  describe '納入機器 管理機能' do
    context '納入情報を新規登録した場合' do
      it '顧客名、納入機器、サポート終了期間が表示される' do
        visit installed_products_path
        visit new_installed_product_path
        select '顧客1', from: 'installed_product[customer_id]'
        select '製品おひつじ', from: 'installed_product[product_id]'
        fill_in 'installed_product_serial_number', with: '12345678'
        select '2020', from: 'installed_product[installed_date(1i)]'
        select '1月', from: 'installed_product[installed_date(2i)]'
        select '1', from: 'installed_product[installed_date(3i)]'
        fill_in 'installed_product_discount_price', with: '1480'
        click_on '登録する'
        click_on '登録する'
        expect(page).to have_content '顧客1'
        expect(page).to have_content '製品おひつじ'
        expect(page).to have_content '12345678'
        expect(page).to have_content '2025年05月05日'
        expect(page).to have_content '2027年07月07日'
      end
    end
  end
end

private
def log_in
  visit new_user_session_path
  fill_in 'user_email', with: 'sales@example.com'
  fill_in 'user_password', with: 'testtest'
  click_on 'ログイン'
end