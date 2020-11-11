class Task < ApplicationRecord
  belogs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :limit, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  belogs_to :user
end
