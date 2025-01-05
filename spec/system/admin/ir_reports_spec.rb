require 'rails_helper'

RSpec.describe "IRレポート", type: :system do
  let!(:admin) { Admin.create!(email_address: "test@example.com", password: "password") }
  let!(:company) { create(:company) }

  before do
    visit new_admin_sessions_path
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"
    click_button "サインイン"
  end

  describe "IRレポート登録" do
    context "正常系" do
      it "登録できること" do
        visit admin_company_ir_reports_path(company)
  
        fill_in "タイトル", with: "テストIRレポート"
        fill_in "内容", with: "これはテストの内容です。"
        fill_in "公開日", with: "2023/10/01 10:00"
        fill_in "Url", with: "http://example.com"
        click_button "登録"
  
        expect(page).to have_content "テストIRレポート"
        expect(page).to have_content "これはテストの内容です。"
      end
    end

    context "異常系" do
      it "登録できないこと" do
        visit admin_company_ir_reports_path(company)

        fill_in "タイトル", with: ""
        fill_in "内容", with: ""
        fill_in "公開日", with: ""
        fill_in "Url", with: ""
        click_button "登録"
        
        expect(page).to have_content "エラー"
      end
    end
  end
end
