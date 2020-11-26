require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'タスクモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'タスクのタイトルが空の場合' do
        it 'バリデーションにひっかる' do
          task = Task.new(title: '', content: '失敗テスト')
          expect(task).not_to be_valid
        end
      end
      context 'タスクの詳細が空の場合' do
        it 'バリデーションにひっかかる' do
          task = Task.new(title: '失敗テスト', content: '')
          expect(task).not_to be_valid
        end
      end
      context 'タスクのタイトルと詳細に内容が記載されている場合' do
        it 'バリデーションが通る' do
          task = Task.new(title: '成功テスト', content: '成功テスト')
          expect(task).to be_valid
      end
    end
  end

  describe '検索機能' do
    let!(:task) {FactoryBot.create(:task, :title: "today")}
    let!(:task) {FactoryBot.create(:task2, :title: "tomorrow")}
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り混まれる" do
        expect(Task.title_search('test').to include(today))
        expect(Task.title_search('test').not_to include(tomorrow))
        expect(Task.title_search('test').count).to eq 1
      end
    end
      context 'scopeメソッド でステータス検索をした場合' do
        it " ステータスに完全に一致するタスクが絞り込まれる" do
          expect(Task.status_search('完了').count).to eq 1
        end
      end
      context 'scopeメソッド でタイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全に一致するタスクが絞りこまれる" do
        expect(Task.title_search('task2').status_serch('着手').count).to eq 1
      end
    end
  end
end
