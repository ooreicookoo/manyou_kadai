# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task　do
    title { 'test_title' }
    content { 'test_content' }
    limit { '2020-11-26 12:00:00'}
    status {'完了'}
    priority {'高'}
  end
  factory :second_task, class: Task do
    title { 'タスク' }
    content { 'コンテント' }
    limit { '2021-11-26 12:00:00'}
    status {'着手'}
    priority {'中'}
  end
  factory :third_task, class: Task do
    title { 'タスク2' }
    content { 'コンテント2' }
    limit { '2022-11-26 12:00:00'}
    status {'未着手'}
    priority {'低'}
  end
end
