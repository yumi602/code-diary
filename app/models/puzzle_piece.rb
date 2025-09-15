class PuzzlePiece < ApplicationRecord
  belongs_to :puzzle

  validates :position, presence: true, uniqueness: { scope: :puzzle_id }
  validates :filled, inclusion: { in: [ true, false ] }
end
