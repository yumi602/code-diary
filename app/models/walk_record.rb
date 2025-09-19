class WalkRecord < ApplicationRecord
  belongs_to :user
  belongs_to :puzzle, optional: true

  validates :date, presence: true

  after_create :fill_puzzle_piece

  private

  def fill_puzzle_piece
    # 紐付け先が明示されていればそれを、なければユーザーの進行中パズルを使う
    target = puzzle || user.puzzles.in_progress.order(created_at: :desc).first
    return unless target

    # 「1日1ピース」判定に使う日付は散歩記録のdate
    target.fill_next_piece!(date: date)
  end
end
