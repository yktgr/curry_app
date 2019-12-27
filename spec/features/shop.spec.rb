require 'rails_helper'
RSpec.feature "ショップ", type: :feature do
before do
  FactoryBot.create(:user)
  FactoryBot.create(:user_second)
  FactoryBot.create(:recipe)
  FactoryBot.create(:recipe_second)
  FactoryBot.create(:shop)
  FactoryBot.create(:shop_second)
  visit root_path
      fill_in 'メールアドレス', with: 'user1@user.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました。'
  end

  scenario "ショップ一覧のテスト" do
    visit shops_path
    expect(page).to have_content 'Bカレー'
    expect(page).to have_content 'Aカレー'
  end

  scenario "ショップ作成のテスト" do
    visit new_shop_path
    fill_in '店名', with: 'テストショップ'
    fill_in '住所', with: 'テスト県'
    click_button '登録する'
    expect(page).to have_content 'ショップを登録しました'
  end

  scenario "ショップ削除のテスト" do
    visit shops_path
    click_link '削除', match: :first
    expect(page).to have_content '削除しました'
  end

  scenario "ショップ検索のテスト" do
    visit shops_path
    fill_in '店名', with: 'B'
    click_button "検索"
    expect(page).not_to have_content 'Aカレー'
    expect(page).to have_content 'Bカレー'
  end
end
