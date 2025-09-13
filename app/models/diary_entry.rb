class DiaryEntry < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  enum mood: {
    good: 0,
    normal: 1,
    bad: 2,
    excited: 3,
    tired: 4
  }

  # バリデーション
  validates :walked_on, presence: true
  validates :body, presence: true
end
