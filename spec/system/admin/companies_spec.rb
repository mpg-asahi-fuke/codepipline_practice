require 'rails_helper'

RSpec.describe "会社情報", type: :system do
  let!(:admin) { Admin.create!(email_address: "test@example.com", password: "password") }

  before do
    visit new_admin_sessions_path
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"
    click_button "サインイン"
  end

  describe "会社登録" do
    context "正常系" do
      it "登録できること" do
        visit admin_companies_path

        fill_in "Name", with: "テスト株式会社"
        fill_in "Number", with: "123456789"
        click_button "登録"

        expect(page).to have_content "テスト株式会社"
        expect(page).to have_content "123456789"
      end
    end

    context "異常系" do
      it "登録できないこと" do
        visit admin_companies_path

        fill_in "Name", with: ""
        fill_in "Number", with: ""
        click_button "登録"

        expect(page).to have_content "エラー"
      end
    end
  end
end
