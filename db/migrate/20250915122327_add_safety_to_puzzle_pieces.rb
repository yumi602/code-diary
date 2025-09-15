class AddSafetyToPuzzlePieces < ActiveRecord::Migration[7.2]
  def change
    change_column_default :puzzle_pieces, :filled, from: nil, to: false
    change_column_null    :puzzle_pieces, :filled, false
    add_index :puzzle_pieces, [ :puzzle_id, :position ],
              unique: true, name: "index_pieces_on_puzzle_and_position"
  end
end
