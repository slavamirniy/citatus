class Quoute < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 140 }

  default_scope -> { order(created_at: :desc) }
end
