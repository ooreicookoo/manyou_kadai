require 'rails_helper'
RSpec.describe ユーザ登録, type: :system do
  before do
    @sencond_user = FactoryBot.create(:second_user)
    @user = FactoryBot.create(:user)
  end
  describe '新規登録機能' do
    context 'ユーザを新規作成した場合' do
      it '作成したユーザが表示される' do
      visit new_user_path
      fill_in "name", with; "ShimizuKeiko"
      fill_in "Email address", with; "Shimizu@gmail.com"
      fill_in "Password", with; "098765"
      fill_in "Password_confirmation", with; "098765"
      click_button "Create"
      expect(page).to have_content "Shimizu@gmail.com"
    end
  end
  context 'ユーザがログインせずタスク一覧画面に飛ぼうとした' do
    it 'ログイン画面に遷移する' do
      visit tasks_path
      expect(page).t have_content 'ログイン'
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'ログインをしようとすると' do
      it 'ログインができる' do
        visit new_session_path
        fill_in "Email address", with; "Shimizu@gmail.com"
        fill_in "Password", with; "098765"
        fill_in "Password_confirmation", with; "098765"
        click_on "Log in"
        expect(page).to have_content "Shimizu@gmail.com"
      end
      it '他人の詳細画面に飛ぶとタスク一覧画面に遷移すると' do
        visit new_session_path
        ill_in "Email address", with; "Shimizu@gmail.com"
        fill_in "Password", with; "098765"
        fill_in "Password_confirmation", with; "098765"
        click_on "Log in"
        visit user_path(@user.id)
        expect(current_path).to eq tasks_path
      end
      it 'ログアウトができる' do
        visit new_session_path
        ill_in "Email address", with; "Shimizu@gmail.com"
        fill_in "Password", with; "098765"
        fill_in "Password_confirmation", with; "098765"
        click_on "Log in"
        click_on "ログアウト"
        visit user_path(@user.id)
        expect(current_path).to eq new_session_path
      end
    end
    context '管理画面に遷移しようとすると' do
      it 'タスク一覧に遷移する' do
        visit new_session_path
        ill_in "Email address", with; "Shimizu@gmail.com"
        fill_in "Password", with; "098765"
        fill_in "Password_confirmation", with; "098765"
        click_on "Log in"
        visit admin_user_path
        expect(current_path).to eq tasks_path
      end
    end
  end

  describe '管理機能' do
    before do
      visit new_session_path
      fill_in "Email address", with: 'admin@example.jp'
      fill_in "Password", with: 'password'
      click_on 'Log in'
    end
    context '管理ユーザー' do
      it '管理画面にアクセスできる' do
        visit admin_user_path
        expect(page).to have_content 'Users'
      end
      it 'ユーザの新規登録ができる' do
        visit admin_user_path
        click_on 'new'
        fill_in "name", with: 'test'
        fill_in "Email address", with: 'test@test.com'
        fill_in "Password", with: 'testtest'
        fill_in "Password_confirmation", with: 'testtest'
        click_button "Create"
        expect(page).to have_content 'test@test.com'
      end
      it 'ユーザの詳細画面にアクセス' do
        visit admin_user_path(second_user.id)
        expect(page).to have_content "shimizu@gmail.com"
      end
      it 'ユーザの編集画面からユーザを編集' do
        visit edid_admin_user_path(@second_user.id)
        fill_in "name", with: 'ShimizuKeiko'
        fill_in "Email address", with: 'shimizu@takeru.com'
        fill_in "Password", with: '098765'
        fill_in "Password_confirmation", with: '098765'
        click_on 'Create'
        expect(page).to have_content 'shimizu@takeru.com'
      end
      it 'ユーザーの削除ができる' do
        visit admin_user_path
        page.accept_confirm do
          click_on :delete_button
        end
        expect(page).not_to have_content 'test'
      end
    end
    context '一般ユーザがログインしようとすると' do
      it '管理画面にアクセスできない' do
        click_on 'ログアウト'
        visit new_session_path
        fill_in "name", with: 'ShimizuKeiko'
        fill_in "Email address", with: 'shimizu@takeru.com'
        fill_in "Password", with: '098765'
        fill_in "Password_confirmation", with: '098765'
        click_on 'Log in'
        expect(current_path).to eq tasks_path
      end
    end
  end
end
