# 「FactoryBotを使用します」という記述
FactoryBot.define do
  factory :task do
    title { 'test_title' }
    content { 'test_content' }
    limit { '2020-09-02 12:00:00'}
    status { '完了' }
    priority { '高' }
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    title { 'タスク' }
    content { 'コンテント' }
    limit { '2021-09-12 12:00:00'}
    status { '着手' }
    priority { '中' }
  end
  factory :third_task, class: Task do
    title { 'タスク２' }
    content { 'コンテント２' }
    limit { '2022-09-22 12:00:00'}
    status { '未着手' }
    priority { '低' }
  end
end
