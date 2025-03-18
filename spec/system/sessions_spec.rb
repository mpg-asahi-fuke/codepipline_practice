require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let!(:admin) { Admin.create!(email_address: "test@example.com", password: "password") }

  describe "ログイン機能" do
    before { visit new_sessions_path }

    it "有効な認証情報でログインできること" do
      binding.b
      # フォームの入力
      fill_in "email_address", with: "test@example.com"
      fill_in "password", with: "password"
      
      # ログインボタンをクリック
      click_button "サインイン"
      
      # ログイン後のリダイレクト先を確認
      expect(page).to have_current_path("/")
    end

    it "無効な認証情報ではエラーメッセージが表示されること" do
      # 無効なパスワードを入力
      fill_in "email_address", with: "test@example.com"
      fill_in "password", with: "wrong_password"
      
      # ログインボタンをクリック
      click_button "サインイン"
      
      # エラーメッセージが表示されることを確認
      expect(page).to have_css("div", text: "Try another email address or password.")
      # ログイン画面に留まることを確認
      expect(page).to have_current_path(new_sessions_path)
    end

    it "レート制限が適用されること" do
      # レート制限のテスト（10回連続で失敗するとブロックされる）
      11.times do 
        fill_in "email_address", with: "test@example.com"
        fill_in "password", with: "wrong_password"
        click_button "サインイン"
      end
      
      # 11回目はレート制限メッセージが表示される
      expect(page).to have_css("div", text: "Try again later.")
    end
  end

  describe "ログアウト機能" do
    before do
      # ログイン状態を作る
      allow_any_instance_of(ApplicationController).to receive(:authenticated?).and_return(true)
      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)
    end

    it "ログアウトできること" do
      visit "/"
      # ログアウトリンクが存在する場合はクリック
      # 注: 実際のアプリケーションに合わせて調整する必要があります
      if page.has_link?("ログアウト")
        click_link "ログアウト"
      else
        # ログアウト用のAPIエンドポイントに直接アクセス
        page.driver.submit :delete, session_path, {}
      end
      
      # ログアウト後にログイン画面にリダイレクトされることを確認
      expect(page).to have_current_path(new_sessions_path)
    end
  end
end
