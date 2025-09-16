class CreateWalkRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :walk_records do |t|
      t.date :date
      t.text :note
      t.string :photo
      t.references :user, null: false, foreign_key: true
      t.references :puzzle, null: true, foreign_key: true

      t.timestamps
    end
  end
end
