class CreatePuzzlePieces < ActiveRecord::Migration[7.2]
  def change
    create_table :puzzle_pieces do |t|
      t.references :puzzle, null: false, foreign_key: true
      t.integer :position
      t.string :image
      t.boolean :filled

      t.timestamps
    end
  end
end
