class CreatePuzzles < ActiveRecord::Migration[7.2]
  def change
    create_table :puzzles do |t|
      t.string :title
      t.string :image
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.datetime :completed_at

      t.timestamps
    end
  end
end
