class Task < ApplicationRecord
  validates :title,:description,:score, presence: true
  belongs_to :user

  scope :recent, -> { order("created_at DESC")}
end
