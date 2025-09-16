class WalkRecord < ApplicationRecord
  belongs_to :user
  belongs_to :puzzle, optional: true

  # 写真アップロード (CarrierWave)
  # mount_uploader :photo, PhotoUploader

  validates :date, presence: true
end
