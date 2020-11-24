class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: {in: 1..100}
  enum status: { 未着手: 0, 着手: 1, 完了: 2 }
  enum priority: { 高: 0, 中: 1, 低: 2 }

end
