class Puzzle < ApplicationRecord
  belongs_to :user
  has_many :puzzle_pieces, dependent: :destroy

  enum status: { in_progress: "in_progress", completed: "completed" }

  scope :in_progress, -> { where(status: :in_progress) }

  validates :title, presence: true
  validates :image, presence: true

  after_create :generate_pieces

  # === 追加部分 ===
  # 指定日の分がまだなら、空いているピースをランダムで1つ埋める
  def fill_next_piece!(date: Time.zone.today)
    return if completed?
    return if filled_on?(date)

    empty = puzzle_pieces.where(filled: false)
    piece = empty.sample
    return unless piece # 念のため

    piece.update!(filled: true)

    # これが最後のピースなら completed に変更
    if empty.count == 1
      update!(status: :completed, completed_at: Time.current)
    end
  end

  # 指定日にすでに1ピース埋めたか？
  def filled_on?(date)
    range = date.in_time_zone.beginning_of_day..date.in_time_zone.end_of_day
    puzzle_pieces.where(filled: true, updated_at: range).exists?
  end

  def completed?
    status == "completed"
  end

  private

  def generate_pieces
    (1..7).each do |i|
      puzzle_pieces.create!(position: i, image: "piece#{i}.jpg", filled: false)
    end
  end
end
