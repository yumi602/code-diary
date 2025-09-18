class WalkRecord < ApplicationRecord
  belongs_to :user
  belongs_to :puzzle, optional: true

  validates :date, presence: true

  after_create :fill_puzzle_piece

  private

  def fill_puzzle_piece
    # 紐付け先が明示されていればそれを、なければユーザーの進行中パズルを使う
    target = puzzle || user.puzzle.in_progress.order(created_at: :desc).first
    nil unless
    # 「1日1ピース」判定に使う日付は散歩記録のdate
    target.fill_nest_piece!(date: date)
  end
end
