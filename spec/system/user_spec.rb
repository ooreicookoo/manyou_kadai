require 'rails_helper'
RSpec.describe ユーザ登録, type: :system do
  before do
    @sencond_user = FactoryBot.create(:second_user)
    @user = FactoryBot.create(:user)
end
  describe '新規登録機能' do
    context 'ユーザを新規作成した場合' do
      it '作成したユーザが表示される' do
      expect(5 + 5).to eq 10
    end
  end
describe '新規作成機能' do
    context '【ユーザの新規登録ができること】' do

        【共通の前準備をする】
      end
      it 'ユーザがログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移すること' do
        【テストの処理（〇〇になることを期待する）】
      end
    end
  end
