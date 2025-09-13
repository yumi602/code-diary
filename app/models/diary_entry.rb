class DiaryEntry < ApplicationRecord
  belongs_to :user

  enum mood: {
    good: 0,
    normal: 1,
    bad: 2,
    excited: 3,
    tired: 4
  }
end
