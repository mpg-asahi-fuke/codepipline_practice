require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let!(:admin) { Admin.create!(email_address: "test@example.com", password: "password") }

  describe "ログイン機能" do
    before { visit new_admin_sessions_path }

    it "有効な認証情報でログイン・ログアウトができること" do
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "password"

      click_button "サインイン"

      expect(page).to have_content "会社情報"

      click_link "ログアウト"
      expect(page).to have_content "サインイン"
    end
  end
end
