require 'rails_helper'

RSpec.describe "ログイン", type: :system do
  it '管理画面にログインできること' do
    visit new_sessions_path

    fill_in 'Email',    with: @user.email
    fill_in 'Password', with: @user.password

    # ログインボタンをクリック
    click_button 'Sign in'

    expect(page).to have_content('接続OK')
  end
end
